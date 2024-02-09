import 'package:dao/comonents/add_remove_song_buttons.dart';
import 'package:dao/comonents/audio_control_buttons.dart';
import 'package:dao/comonents/audio_progress_bar.dart';
import 'package:dao/comonents/current_song_title.dart';
import 'package:dao/comonents/play_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';

class PlayerScreen extends Screen {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            CurrentSongTitle(),
            Playlist(),
            AudioProgressBar(),
            AudioControlButtons(),
            AddRemoveSongButtons(),
          ],
        ),
      ),
    );
  }

  @override
  String get routeName => 'home';

  @override
  String get routePath => '/';
}
