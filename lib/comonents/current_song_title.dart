import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/providers/player.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentSongTitle extends HookConsumerWidget {
  const CurrentSongTitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(ref.watch(playerProvider()), (viewModel) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          viewModel.currentSongItem?.displayName ?? '未播放',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      );
    });
  }
}
