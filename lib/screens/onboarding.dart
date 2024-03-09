import 'package:dao/comonents/onboarding_page.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/models/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingScreen extends Screen {
  static const RouteConfig route = RouteConfig('onboarding', '/onboarding');

  @override
  String get routeName => route.name;

  @override
  String get routePath => route.path;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _OnboardingView();
  }
}

class _OnboardingView extends HookConsumerWidget {
  const _OnboardingView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);
    final controller = usePageController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 77),
                    curve: Curves.bounceInOut,
                  );
                },
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    index.value = value;
                  },
                  children: [
                    OnboardingPage.first(),
                    OnboardingPage.second(),
                    OnboardingPage.third(),
                    OnboardingPage.last(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24)
                  .copyWith(bottom: 48),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox(
                    height: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          4,
                          (value) => GestureDetector(
                            onTap: () {
                              controller.jumpToPage(value);
                            },
                            child: Container(
                              width: index.value == value ? 48 : 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 6.0,
                              ),
                              decoration: index.value == value
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.sulu.value,
                                    )
                                  : BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.sulu.value,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
