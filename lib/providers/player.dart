import 'package:dao/models/song.dart';
import 'package:dao/repositories/song_hive_repository.dart';
import 'package:dao/services/song_hive_service.dart';

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
    @Default(null) AudioPlayer? audioPlayer,
    @Default(null) ConcatenatingAudioSource? playlist,
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
  }) async {
    return const PlayerViewModel();
  }

  SongHiveService get _service => SongHiveService(repository: repository);

  void addSong() {}

  void removeSong() {}

  void seek(Duration value) {}

  void onRepeatButtonPressed() {}

  void onPreviousSongButtonPressed() {}

  void play() {}

  void pause() {}

  void onNextSongButtonPressed() {}
}
