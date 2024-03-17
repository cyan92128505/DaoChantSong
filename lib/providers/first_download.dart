import 'dart:io';

import 'package:dao/models/song.dart';
import 'package:dao/providers/player_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:path_provider/path_provider.dart';

part 'first_download.g.dart';
part 'first_download.freezed.dart';

@freezed
class LocalAssetSong with _$LocalAssetSong {
  const LocalAssetSong._();
  factory LocalAssetSong({
    required String id,
    required String title,
    required String path,
    required int sort,
  }) = _LocalAssetSong;
}

Future<File> getFileFromAssets(
    LocalAssetSong song, FirstDownloadRef ref) async {
  final byteData = await rootBundle.load(song.path);

  final file = File('${(await getTemporaryDirectory()).path}/${song.path}}');
  await file.create(recursive: true);
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  ref.read(playerViewProvider().notifier).addSongFromSongItem(
        SongItem(
          id: song.id,
          filePath: file.path,
          title: song.title,
          sort: song.sort,
        ),
      );
  return file;
}

@riverpod
Future<void> firstDownload(FirstDownloadRef ref) async {
  await Future.wait([
    LocalAssetSong(
      id: 'local-asset-1',
      title: '早朝',
      path: "assets/music/1.早朝.mp3",
      sort: 1,
    ),
    LocalAssetSong(
      id: 'local-asset-2',
      title: '開天符',
      path: "assets/music/2.開天符.mp3",
      sort: 2,
    ),
    LocalAssetSong(
      id: 'local-asset-3',
      title: '誦經香讚',
      path: "assets/music/3.誦經香讚.mp3",
      sort: 3,
    ),
    LocalAssetSong(
      id: 'local-asset-4',
      title: '衛靈咒',
      path: "assets/music/4.衛靈咒.mp3",
      sort: 4,
    ),
    LocalAssetSong(
      id: 'local-asset-5',
      title: '萬年歡',
      path: "assets/music/5.萬年歡.mp3",
      sort: 5,
    ),
    LocalAssetSong(
      id: 'local-asset-6',
      title: '收尾',
      path: "assets/music/6.收尾.mp3",
      sort: 6,
    ),
  ].map((path) {
    return getFileFromAssets(path, ref);
  }));

  return;
}
