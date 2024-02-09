import 'package:dao/comonents/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioControlButtons extends HookConsumerWidget {
  const AudioControlButtons({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RepeatButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
        ],
      ),
    );
  }
}
