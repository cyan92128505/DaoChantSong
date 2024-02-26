import 'dart:io';

import 'package:dao/models/song.dart';
import 'package:dao/services/song_hive_service.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

part 'youtube_download.g.dart';

@riverpod
class DownloadList extends _$DownloadList {
  @override
  List<String> build() {
    return [];
  }

  setup() async {
    final list = (await SongHiveService().getSongList()).map((e) => e.id);

    state = [
      'pwAVCWt494M',
      'nl-YTnC7wVc',
      'puItFgHXjlo',
      '0K5viR5FKGM',
      'UFCfiVFzqMM',
      'c-HBnuZfEtU',
      'R_5lEtINufE',
      'UwN3SqfjbvQ'
    ].where((element) => list.contains(element) == false).toList();
  }

  download(String id) async {
    final list = state.map((e) => e).toList();

    list.remove(id);

    state = list;

    ref.read(youtubeDonwloadProvider.notifier).download(id);
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
    final fileName = '${video.title}.${audio.container.name}'
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

    // Create the message and set the cursor position.
    final msg = 'Downloading ${video.title}.${audio.container.name}';
    debugPrint(msg);

    // Listen for data received.
    await for (final data in audioStream) {
      // Keep track of the current downloaded data.
      count += data.length;

      // Calculate the current progress.
      final progress = ((count / len) * 100).ceil();

      debugPrint(progress.toStringAsFixed(2));

      // Write to file.
      output.add(data);
    }
    await output.close();

    SongHiveService().addSong(
      SongItem(
        id: id,
        filePath: file.path,
        title: fileName,
      ),
    );
  }
}
