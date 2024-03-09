import 'package:dao/comonents/add_song_buttons.dart';
import 'package:dao/comonents/app_bar_icon.dart';
import 'package:dao/comonents/console_panel.dart';
import 'package:dao/comonents/play_list.dart';
import 'package:dao/providers/local_storage/first_open_app.dart';
import 'package:dao/screens/player.dart';
import 'package:dao/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcaseview/showcaseview.dart';

GlobalKey _one = GlobalKey();

class ShowCasePage extends HookConsumerWidget {
  const ShowCasePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) => const _ShowCasePageContent(),
      ),
      onFinish: () {
        ref.read(firstOpenAppProvider.notifier).setup(false);
        context.go(PlayerScreen.route.path);
      },
    );
  }
}

class _ShowCasePageContent extends HookConsumerWidget {
  const _ShowCasePageContent();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = useCallback(() {
      ShowCaseWidget.of(context).startShowCase([
        _one,
      ]);
    });

    useEffect(() {
      Future.delayed(const Duration(milliseconds: 77)).then((value) => show());
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AppBarIcon(),
        actions: [
          IconButton(
            onPressed: () {
              context.push(SettingScreen().routePath);
            },
            icon: const Icon(
              Icons.settings,
              size: kTextTabBarHeight,
            ),
          )
        ],
      ),
      body: const Column(
        children: [
          ConsolePanel(),
          Playlist(),
        ],
      ),
      floatingActionButton: Showcase(
        key: _one,
        title: '上傳',
        description: '從這裡開始整合您的經典音樂 (mp3/mp4)',
        targetShapeBorder: const CircleBorder(),
        child: const AddSongButton(),
      ),
    );
  }
}
