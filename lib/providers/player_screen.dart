import 'dart:async';

import 'package:dao/models/song.dart';
import 'package:dao/providers/audio_player.dart';
import 'package:dao/repositories/song_hive_repository.dart';
import 'package:dao/services/song_hive_service.dart';
import 'package:file_picker_pro/file_data.dart';
import 'package:flutter/foundation.dart';

import 'package:just_audio/just_audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_screen.g.dart';
part 'player_screen.freezed.dart';

enum PlayerState {
  paused,
  playing,
  loading,
}

enum RepeatState {
  off,
  repeatSong,
  repeatPlaylist,
}

@freezed
class ProgressBarState with _$ProgressBarState {
  const ProgressBarState._();

  const factory ProgressBarState({
    @Default(Duration.zero) Duration current,
    @Default(Duration.zero) Duration buffered,
    @Default(Duration.zero) Duration total,
  }) = _ProgressBarState;
}

@freezed
class PlayerViewModel with _$PlayerViewModel {
  const PlayerViewModel._();

  const factory PlayerViewModel({
    @Default(<SongItem>[]) List<SongItem> songs,
    @Default(null) SongItem? currentSongItem,
    @Default(ProgressBarState()) ProgressBarState progressBarState,
    @Default(PlayerState.paused) PlayerState playerState,
  }) = _PlayerViewModel;

  PlayerViewModel clean() {
    return copyWith(
      currentSongItem: null,
      progressBarState: const ProgressBarState(),
      playerState: PlayerState.paused,
    );
  }
}

@riverpod
class PlayerScreen extends _$PlayerScreen {
  @override
  FutureOr<PlayerViewModel> build({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  }) async {
    final viewModel = await getPlayList(initial: true);
    setupAudioPlayer();
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();

    return viewModel;
  }

  PlayerViewModel get _viewModel =>
      state.asData?.value ?? const PlayerViewModel();
  SongHiveService get _service => SongHiveService(repository: repository);

  Future<void> setupAudioPlayer() async {
    try {
      final audioPlayer = ref.read(appAudioPlayerProvider);
      await audioPlayer.pause();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<PlayerViewModel> getPlayList({
    bool initial = false,
  }) async {
    final list = await _service.getSongList();

    list.sort(((a, b) => a.sort.compareTo(b.sort)));

    var viewModel = _viewModel.copyWith(
      songs: list,
    );

    if (initial == false) {
      state = AsyncData(viewModel);
    }

    return viewModel;
  }

  void addSong(FileData fileData) {
    _service.addSong(
      SongItem(
        id: SongItem.getCustomUniqueId(),
        filePath: fileData.filePath,
        title: fileData.fileName,
      ),
    );
    getPlayList();
  }

  void addSongFromSongItem(SongItem songItem) {
    _service.addSong(
      songItem,
    );
    getPlayList();
  }

  void removeSong(SongItem songItem) {
    if (_viewModel.currentSongItem?.id == songItem.id) {
      state = AsyncData(_viewModel.clean());

      ref.read(appAudioPlayerProvider).pause();
    }
    _service.removeSong(songItem);
    getPlayList();
  }

  Future<void> removeAllSong() async {
    if (_viewModel.currentSongItem != null) {
      state = AsyncData(_viewModel.clean());

      ref.read(appAudioPlayerProvider).pause();
    }

    await Future.wait(
      _viewModel.songs.where((element) => element.id.length > 6).map(
            (songItem) => _service.removeSong(songItem),
          ),
    );

    getPlayList();
  }

  void play(SongItem songItem) async {
    try {
      if (_viewModel.currentSongItem?.id == songItem.id &&
          _viewModel.playerState != PlayerState.paused) {
        state = AsyncData(_viewModel.clean());
        await ref.read(appAudioPlayerProvider).pause();
        return;
      }

      if (_viewModel.currentSongItem?.id != songItem.id) {
        state = AsyncData(_viewModel.copyWith(currentSongItem: songItem));

        await ref.read(appAudioPlayerProvider).pause();
        final source = AudioSource.file(songItem.filePath,
            tag: MediaItem(
              id: songItem.id,
              title: songItem.title,
            ));
        await ref.read(appAudioPlayerProvider).setAudioSource(source);
      }

      ref.read(appAudioPlayerProvider).play();
      final countSongItem = songItem.copyWith(
        count: songItem.count + 1,
      );
      updateSongItem(countSongItem);
    } on PlayerException catch (e) {
      debugPrint("Error code: ${e.code}");
      debugPrint("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      debugPrint("Connection aborted: ${e.message}");
    } catch (e) {
      // Fallback for all other errors
      debugPrint('An error occured: $e');
    }
  }

  updateSongItem(SongItem songItem) {
    _service.updateSong(
      songItem,
    );
    var songs = _viewModel.songs.toList();
    songs = songs.map((e) {
      if (e.id == songItem.id) {
        return songItem;
      }
      return e;
    }).toList();

    state = AsyncData(_viewModel.copyWith(songs: songs));
  }

  void pause() {
    ref.read(appAudioPlayerProvider).pause();
  }

  void seek(Duration position) {
    ref.read(appAudioPlayerProvider).seek(position);
  }

  Future<void> onReorder(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    var songs = _viewModel.songs.toList();

    final item = songs.removeAt(oldIndex);
    songs.insert(newIndex, item);

    for (var i = 0; i < songs.length; i++) {
      songs[i] = songs[i].copyWith(sort: i);
      _service.updateSong(songs[i]);
    }

    state = AsyncData(_viewModel.copyWith(songs: songs));
  }

  void _listenForChangesInPlayerState() {
    ref.read(appAudioPlayerProvider).playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        state = AsyncData(_viewModel.copyWith(
          playerState: PlayerState.loading,
        ));
      } else if (!isPlaying) {
        state = AsyncData(_viewModel.copyWith(
          playerState: PlayerState.paused,
        ));
      } else if (processingState != ProcessingState.completed) {
        state = AsyncData(_viewModel.copyWith(
          playerState: PlayerState.playing,
        ));
      } else {
        ref.read(appAudioPlayerProvider).seek(Duration.zero);
        ref.read(appAudioPlayerProvider).pause();
        state = AsyncData(_viewModel.clean());
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    ref.read(appAudioPlayerProvider).positionStream.listen((position) {
      final oldState = _viewModel.progressBarState;
      state = AsyncData(
        _viewModel.copyWith(
          progressBarState: ProgressBarState(
            current: position,
            buffered: oldState.buffered,
            total: oldState.total,
          ),
        ),
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    ref
        .read(appAudioPlayerProvider)
        .bufferedPositionStream
        .listen((bufferedPosition) {
      final oldState = _viewModel.progressBarState;
      state = AsyncData(
        _viewModel.copyWith(
          progressBarState: ProgressBarState(
            current: oldState.current,
            buffered: bufferedPosition,
            total: oldState.total,
          ),
        ),
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    ref.read(appAudioPlayerProvider).durationStream.listen((totalDuration) {
      final oldState = _viewModel.progressBarState;
      state = AsyncData(
        _viewModel.copyWith(
          progressBarState: ProgressBarState(
            current: oldState.current,
            buffered: oldState.buffered,
            total: totalDuration ?? Duration.zero,
          ),
        ),
      );
    });
  }
}
