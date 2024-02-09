import 'package:dao/repositories/song_hive_repository.dart';

class SongHiveService {
  SongHiveService({
    this.repository,
  });
  final SongHiveRepository? repository;
  SongHiveRepository get _repository => repository ?? songHiveRepository;
}
