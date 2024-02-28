import 'package:dao/assets/logo_svg.dart';
import 'package:dao/comonents/audio_progress_bar.dart';
import 'package:dao/comonents/current_song_title.dart';
import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/providers/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConsolePanel extends HookConsumerWidget {
  const ConsolePanel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataSourceWrap(ref.watch(playerScreenProvider()), (viewModel) {
      if (viewModel.songs.isEmpty) {
        return Container();
      }

      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Center(
              child: SvgPicture.string(
                logoSvg(),
                width: 64,
                colorFilter: ColorFilter.mode(
                  viewModel.currentSongItem == null
                      ? AppColor.newYorkPink.value
                      : AppColor.newYorkPink.value.withAlpha(16),
                  BlendMode.modulate,
                ),
              ),
            ),
            const Column(
              children: [
                CurrentSongTitle(),
                AudioProgressBar(),
              ],
            )
          ],
        ),
      );
    });
  }
}
