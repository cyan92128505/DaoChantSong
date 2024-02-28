import 'package:dao/assets/logo_svg.dart';
import 'package:dao/configs/theme.dart';
import 'package:dao/hooks/use_screen_size.dart';
import 'package:dao/screens/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Splash extends Screen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const _SplashScreen();
  }

  @override
  String get routeName => 'splash';

  @override
  String get routePath => '/';
}

class _SplashScreen extends HookConsumerWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = useScreenSize();

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 777)).then((_) {
        GoRouter.of(context).go(Player().routePath);
      });
      return null;
    }, []);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SvgPicture.string(
                logoSvg,
                width: size.width / 3,
                colorFilter: ColorFilter.mode(
                  AppColor.newYorkPink.value,
                  BlendMode.modulate,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Center(
              child: SvgPicture.string(
                titleSvg,
                width: size.width / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
