import 'package:dao/configs/theme.dart';
import 'package:dao/repositories/hive_repository.dart';
import 'package:dao/repositories/local_storage/local_storage.dart';
import 'package:dao/repositories/song_hive_repository.dart';
import 'package:dao/screens/onboarding.dart';
import 'package:dao/screens/player.dart';
import 'package:dao/screens/setting.dart';
import 'package:dao/screens/show_case.dart';
import 'package:dao/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router_plus/go_router_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';

void main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  await LocalStorage.initial();
  await HiveRepository.hiveInitial();
  await songHiveRepository.initial();

  final router = createGoRouter(
    screens: [
      SplashScreen(),
      PlayerScreen(),
      SettingScreen(),
      ShowCaseScreen(),
      OnboardingScreen(),
    ],
    refreshNotifiers: [],
  );
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: defaultThemeData,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      ),
    ),
  );
}
