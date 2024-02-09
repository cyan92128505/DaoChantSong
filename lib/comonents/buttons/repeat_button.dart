import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepeatButton extends HookConsumerWidget {
  const RepeatButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(
      ref.watch(playerProvider()),
      (viewModel) => IconButton(
        icon: switch (viewModel.repeatState) {
          RepeatState.off => const Icon(Icons.repeat, color: Colors.grey),
          RepeatState.repeatSong => const Icon(Icons.repeat_one),
          RepeatState.repeatPlaylist => const Icon(Icons.repeat),
        },
        onPressed: ref.read(playerProvider().notifier).onRepeatButtonPressed,
      ),
    );
  }
}
