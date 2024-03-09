import 'dart:io';

import 'package:dao/models/remote_song.dart';
import 'package:dao/models/song.dart';
import 'package:dao/providers/player_view.dart';
import 'package:dao/repositories/remote_song_repository.dart';
import 'package:dao/services/song_hive_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'youtube_download.g.dart';

@riverpod
class DownloadList extends _$DownloadList {
  @override
  List<RemoteSong> build() {
    return [];
  }

  setup() async {
    final list = (await SongHiveService().getSongList()).map((e) => e.id);
    final testData = await RemoteSongRepository.getTestData();

    state =
        testData.where((element) => list.contains(element) == false).toList();
  }

  Future<void> downloadAll() async {
    for (var remoteSong in state) {
      download(remoteSong.id);
    }
  }

  Future<void> download(String id) async {
    ref.read(youtubeDonwloadProvider.notifier).download(id);
  }

  setupProcess(String id, double process) {
    final list = state.map((e) => e).toList();

    for (var i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        list[i] = list[i].copyWith(
          processNow: process != RemoteSong.maxProcess,
          process: process,
        );
        break;
      }
    }

    state = list;
  }
}

@riverpod
class YoutubeDonwload extends _$YoutubeDonwload {
  @override
  YoutubeExplode build() {
    return YoutubeExplode();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<void> download(String id) async {
    // Get video metadata.
    final video = await state.videos.get(id);

    // Get the video manifest.
    final manifest = await state.videos.streamsClient.getManifest(id);
    final streams = manifest.audioOnly;

    // Get the audio track with the highest bitrate.
    final audio = streams.first;
    final audioStream = state.videos.streamsClient.get(audio);

    // Compose the file name removing the unallowed characters in windows.
    final fileName = video.title
        .replaceAll(r'\', '')
        .replaceAll('/', '')
        .replaceAll('*', '')
        .replaceAll('?', '')
        .replaceAll('"', '')
        .replaceAll('<', '')
        .replaceAll('>', '')
        .replaceAll('|', '');

    final file = File('${await _localPath}/$fileName.mp3');
    final output = file.openWrite(mode: FileMode.writeOnlyAppend);

    // Track the file download status.
    final len = audio.size.totalBytes;
    var count = 0;

    // Listen for data received.
    await for (final data in audioStream) {
      // Keep track of the current downloaded data.
      count += data.length;

      // Calculate the current progress.
      final process = ((count / len) * RemoteSong.maxProcess).ceil();

      ref
          .read(downloadListProvider.notifier)
          .setupProcess(id, process.toDouble());

      // Write to file.
      output.add(data);
    }

    ref
        .read(downloadListProvider.notifier)
        .setupProcess(id, RemoteSong.maxProcess);

    await output.close();

    ref.read(playerViewProvider().notifier).addSongFromSongItem(
          SongItem(
            id: id,
            filePath: file.path,
            title: fileName,
          ),
        );
  }
}
