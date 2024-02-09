import 'package:dao/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NextSongButton extends HookConsumerWidget {
  const NextSongButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.skip_next),
      onPressed: ref.read(playerProvider().notifier).onNextSongButtonPressed,
    );
  }
}
