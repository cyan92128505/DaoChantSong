import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player.g.dart';

@riverpod
class AppAudioPlayer extends _$AppAudioPlayer {
  @override
  AudioPlayer build() {
    ref.onDispose(() {
      state.dispose();
    });
    return AudioPlayer();
  }
}
