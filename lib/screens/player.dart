import 'package:dao/comonents/add_song_buttons.dart';
import 'package:dao/comonents/app_bar_icon.dart';
import 'package:dao/comonents/console_panel.dart';
import 'package:dao/comonents/play_list.dart';
import 'package:dao/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class Player extends Screen {
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
              context.push(Setting().routePath);
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

  @override
  String get routeName => 'player';

  @override
  String get routePath => '/player';
}
