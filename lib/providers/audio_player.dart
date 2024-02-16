import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_player.g.dart';

@Riverpod(keepAlive: true)
class AppAudioPlayer extends _$AppAudioPlayer {
  @override
  AudioPlayer build() {
    debugPrint('AudioPlayer Start');
    ref.onDispose(() {
      state.dispose();
    });
    return AudioPlayer();
  }
}
