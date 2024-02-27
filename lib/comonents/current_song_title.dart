import 'package:dao/assets/logo_svg.dart';
import 'package:dao/comonents/data_source_wrap.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/hooks/use_screen_size.dart';
import 'package:dao/providers/player_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CurrentSongTitle extends HookConsumerWidget {
  const CurrentSongTitle({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = useScreenSize();

    return DataSourceWrap(ref.watch(playerScreenProvider()), (viewModel) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: viewModel.currentSongItem != null
            ? Text(
                viewModel.currentSongItem?.title ?? '',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 40,
                ),
              )
            : SvgPicture.string(
                logoSvg,
                width: size.width / 10,
                colorFilter: ColorFilter.mode(
                  AppColor.newYorkPink.value,
                  BlendMode.modulate,
                ),
              ),
      );
    });
  }
}
