import 'package:dao/assets/svg.dart';
import 'package:dao/configs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyItem extends StatelessWidget {
  const EmptyItem({
    super.key,
    this.fixHeight,
    this.fixWidth,
    this.title,
    this.inSliver,
  });

  final double? fixHeight;
  final double? fixWidth;
  final String? title;
  final bool? inSliver;

  @override
  Widget build(BuildContext context) {
    double height = fixHeight ?? MediaQuery.of(context).size.height;
    double width = fixWidth ?? MediaQuery.of(context).size.width;

    final child = SizedBox(
      height: height * 0.8,
      width: width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(
              logoSvg(),
              width: 80,
              colorFilter: ColorFilter.mode(
                AppColor.pure.value,
                BlendMode.modulate,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              title ?? '目前沒有任何歌曲',
              style: TextStyle(
                color: AppColor.gray.value,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );

    if (inSliver == true) {
      return SliverToBoxAdapter(
        child: child,
      );
    }

    return child;
  }
}
