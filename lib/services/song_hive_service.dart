import 'dart:convert';

import 'package:dao/models/song.dart';
import 'package:dao/repositories/song_hive_repository.dart';

class SongHiveService {
  SongHiveService({
    this.repository,
  });

  final SongHiveRepository? repository;
  SongHiveRepository get _repository => repository ?? songHiveRepository;

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
