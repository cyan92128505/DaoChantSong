import 'package:dao/components/add_song_buttons.dart';
import 'package:dao/components/app_bar_icon.dart';
import 'package:dao/components/console_panel.dart';
import 'package:dao/components/play_list.dart';
import 'package:dao/models/route_config.dart';
import 'package:dao/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class PlayerScreen extends Screen {
  static const RouteConfig route = RouteConfig('player', '/player');

  @override
  String get routeName => route.name;

  @override
  String get routePath => route.path;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const AppBarIcon(),
        actions: [
          IconButton(
            onPressed: () {
              context.push(SettingScreen.route.path);
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
      floatingActionButton: const AddSongButton(),
    );
  }
}
