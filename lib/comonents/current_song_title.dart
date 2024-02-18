import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/providers/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentSongTitle extends HookConsumerWidget {
  const CurrentSongTitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(ref.watch(playerScreenProvider()), (viewModel) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          viewModel.currentSongItem?.title ?? '未播放',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      );
    });
  }
}
