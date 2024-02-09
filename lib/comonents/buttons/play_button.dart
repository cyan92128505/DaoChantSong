import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayButton extends HookConsumerWidget {
  const PlayButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(
      ref.watch(playerProvider()),
      (viewModel) => switch (viewModel.playerState) {
        PlayerState.loading => Container(
            margin: const EdgeInsets.all(8.0),
            width: 32.0,
            height: 32.0,
            child: const CircularProgressIndicator(),
          ),
        PlayerState.paused => IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: ref.read(playerProvider().notifier).play,
          ),
        PlayerState.playing => IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: ref.read(playerProvider().notifier).pause,
          ),
      },
    );
  }
}
