import 'package:dao/assets/svg.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/hooks/use_screen_size.dart';
import 'package:dao/screens/show_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.content,
    required this.svgImage,
    this.imageWidth,
    this.padding,
    this.showFinishButton = false,
  });
  final String title;
  final String content;
  final String svgImage;
  final double? imageWidth;
  final EdgeInsets? padding;
  final bool showFinishButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = useScreenSize();
    return ListView(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: padding ?? EdgeInsets.zero,
              child: SvgPicture.string(
                svgImage,
                width: imageWidth ?? size.width - 32,
              ),
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 24),
            ),
            Visibility(
              visible: showFinishButton,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16)
                    .copyWith(top: 64),
                child: ElevatedButton(
                  onPressed: () {
                    context.go(ShowCaseScreen.route.path);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: AppColor.sulu.value,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '開始',
                        style: TextStyle(fontSize: 24),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  factory OnboardingPage.first() {
    return OnboardingPage(
      title: '歡迎來到點經誦',
      content: '''
在這裡
您可以輕鬆管理您的道教歌曲
創建自己的播放清單
並享受靈性音樂的美好''',
      svgImage: logoSvg(),
      imageWidth: 120,
      padding: const EdgeInsets.symmetric(vertical: 64),
    );
  }

  factory OnboardingPage.second() {
    return const OnboardingPage(
      title: '探索道教音樂的世界',
      content: '''
點經誦提供了一個簡單、方便的方式
讓您收集、組織和播放您最喜愛的道教歌曲
無論您是在冥想、禱告還是放鬆時
都可以找到適合您心靈需求的音樂''',
      svgImage: secondImage,
    );
  }

  factory OnboardingPage.third() {
    return const OnboardingPage(
      title: '個性化您的播放清單',
      content: '''
請上傳您自己的道教歌曲
我們將幫助您創建一個專屬於您的播放清單
您可以輕鬆地更改歌曲標題
隨時隨地享受您喜愛的音樂''',
      svgImage: thirdImage,
    );
  }

  factory OnboardingPage.last() {
    return const OnboardingPage(
      title: '開始使用點經誦吧',
      content: '''
立即開始使用點經誦
探索道教音樂的美妙世界
按下開始按鈕
開啟您的靈性音樂之旅''',
      svgImage: finishImage,
      showFinishButton: true,
    );
  }
}
