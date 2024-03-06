import 'package:dao/assets/svg.dart';
import 'package:dao/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarIcon extends HookConsumerWidget {
  const AppBarIcon({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SvgPicture.string(
      titleSvg(),
      width: 100,
      colorFilter: ColorFilter.mode(
        AppColor.newYorkPink.value,
        BlendMode.modulate,
      ),
    );
  }
}
