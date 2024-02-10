import 'package:dao/models/song.dart';
import 'package:dao/repositories/song_hive_repository.dart';
import 'package:dao/services/audio_player_service.dart';
import 'package:dao/services/song_hive_service.dart';
import 'package:file_picker_pro/file_data.dart';

import 'package:just_audio/just_audio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player.g.dart';
part 'player.freezed.dart';

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
    @Default(null) SongItem? currentSongItem,
    @Default(<SongItem>[]) List<SongItem> songs,
    @Default(ProgressBarState()) ProgressBarState progressBarState,
    @Default(RepeatState.off) RepeatState repeatState,
    @Default(PlayerState.paused) PlayerState playerState,
  }) = _PlayerViewModel;
}

@Riverpod(keepAlive: true)
class Player extends _$Player {
  @override
  FutureOr<PlayerViewModel> build({
    SongHiveRepository? repository,
    AudioPlayer? audioPlayer,
  }) async {
    final viewModel = await getPlayList(initial: true);

    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();

    return viewModel;
  }

  SongHiveService get _service => SongHiveService(repository: repository);
  AudioPlayer get _audioPlayer {
    return audioPlayer ?? audioPlayerService.player;
  }

  PlayerViewModel get _viewModel => state.asData!.value;

  Future<PlayerViewModel> getPlayList({bool initial = false}) async {
    final list = await _service.getSongList();
    var viewModel = initial ? const PlayerViewModel() : state.asData!.value;

    viewModel = viewModel.copyWith(
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

  void removeSong(SongItem songItem) {
    if (_viewModel.currentSongItem?.id == songItem.id) {
      state = AsyncData(_viewModel.copyWith(currentSongItem: null));

      _audioPlayer.pause();
    }
    _service.removeSong(songItem);
    getPlayList();
  }

  void onRepeatButtonPressed() {}

  void onPreviousSongButtonPressed() {}

  void play(SongItem songItem) async {
    if (_viewModel.currentSongItem?.id != songItem.id) {
      state = AsyncData(_viewModel.copyWith(currentSongItem: songItem));

      _audioPlayer.pause();

      _audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
        songItem.source,
      ]));
    } else {
      if (_viewModel.playerState == PlayerState.paused) {
        _audioPlayer.play();
      }

      if (_viewModel.playerState == PlayerState.playing) {
        _audioPlayer.pause();
      }
    }
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
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
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
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
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
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
    _audioPlayer.durationStream.listen((totalDuration) {
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