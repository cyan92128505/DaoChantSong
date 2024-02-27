import 'dart:convert';
import 'dart:io';

import 'package:dao/models/song.dart';
import 'package:dao/repositories/song_hive_repository.dart';
import 'package:path_provider/path_provider.dart';

class SongHiveService {
  SongHiveService({
    this.repository,
  });

  final SongHiveRepository? repository;
  SongHiveRepository get _repository => repository ?? songHiveRepository;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<SongItem?> getSong(String name) async {
    final rawSong = await _repository.get(name);
    if (rawSong == null) {
      return null;
    }
    return _convert(rawSong);
  }

  Future<List<SongItem>> getSongList() async {
    final rawSongList = await _repository.getList();
    return rawSongList
        .map(
          (rawSong) => SongItem.fromJson(
            json.decode(rawSong),
          ),
        )
        .toList();
  }

  Future<void> addSong(SongItem songItem) async {
    await _repository.put(songItem.id, json.encode(songItem.toJson()));
  }

  Future<void> updateSong(SongItem songItem) async {
    await _repository.put(songItem.id, json.encode(songItem.toJson()));
  }

  Future<void> removeSong(SongItem songItem) async {
    await _repository.box!.delete(
      songItem.id,
    );

    if (songItem.id.length == 6) {
      return;
    }

    final rootPath = await _localPath;

    if (songItem.filePath.startsWith(rootPath)) {
      await File(songItem.filePath).delete();
    }
  }

  SongItem? _convert(String raw) {
    try {
      final rawJson = json.decode(raw);
      return SongItem.fromJson(rawJson);
    } catch (e) {
      return null;
    }
  }
}
