import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/providers/player_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AudioProgressBar extends HookConsumerWidget {
  const AudioProgressBar({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(
      ref.watch(playerViewProvider()),
      (viewModel) {
        return Stack(
          children: [
            const SizedBox(
              height: kTextTabBarHeight,
              width: double.maxFinite,
            ),
            Visibility(
              visible: viewModel.currentSongItem != null,
              child: ProgressBar(
                progress: viewModel.progressBarState.current,
                buffered: viewModel.progressBarState.buffered,
                total: viewModel.progressBarState.total,
                onSeek: ref.read(playerViewProvider().notifier).seek,
              ),
            ),
          ],
        );
      },
    );
  }
}
