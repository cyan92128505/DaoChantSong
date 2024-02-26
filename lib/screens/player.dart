import 'package:dao/comonents/add_song_buttons.dart';
import 'package:dao/comonents/audio_progress_bar.dart';
import 'package:dao/comonents/current_song_title.dart';
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
        title: const CurrentSongTitle(),
        actions: [
          IconButton(
            onPressed: () {
              context.push(Setting().routePath);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: const Column(
              children: [
                AudioProgressBar(),
              ],
            ),
          ),
          const Playlist(),
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
