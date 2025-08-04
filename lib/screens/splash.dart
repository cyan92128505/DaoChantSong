import 'dart:async';

import 'package:dao/assets/svg.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/hooks/use_screen_size.dart';
import 'package:dao/models/route_config.dart';
import 'package:dao/providers/local_storage/first_open_app.dart';
import 'package:dao/screens/onboarding.dart';
import 'package:dao/screens/player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends Screen {
  static const RouteConfig route = RouteConfig('splash', '/');

  @override
  String get routeName => route.name;

  @override
  String get routePath => route.path;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _SplashScreen();
  }
}

class _SplashScreen extends HookConsumerWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = useScreenSize();
    final toggle = useState(kDebugMode);

    final gotoNextScreen = useCallback(() {
      final firstOpenApp = ref.read(firstOpenAppProvider);

      if (firstOpenApp) {
        GoRouter.of(context).go(OnboardingScreen.route.path);
      } else {
        GoRouter.of(context).go(PlayerScreen.route.path);
      }
    });

    useEffect(() {
      final future =
          Future.delayed(const Duration(microseconds: 777)).then((_) async {
        if (toggle.value) {
          return;
        }

        gotoNextScreen();

        return;
      });
      return future.ignore;
    }, []);

    return Scaffold(
      backgroundColor: AppColor.newYorkPink.value,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: GestureDetector(
                onDoubleTap: () {
                  toggle.value = true;
                },
                onTap: () {
                  gotoNextScreen();
                },
                child: SvgPicture.string(
                  logoSvg(mainColor: AppColor.pure.value),
                  width: size.width / 3,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: SvgPicture.string(
                titleShadowSvg,
                width: size.width / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
