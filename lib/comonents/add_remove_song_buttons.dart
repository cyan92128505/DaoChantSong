import 'package:dao/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddRemoveSongButtons extends HookConsumerWidget {
  const AddRemoveSongButtons({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: ref.read(playerProvider().notifier).addSong,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: ref.read(playerProvider().notifier).removeSong,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
