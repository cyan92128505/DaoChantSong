import 'hive_repository.dart';

class SongHiveRepository extends HiveRepository<String, String> {
  SongHiveRepository({super.boxKey = 'songBox'});
}

final songHiveRepository = SongHiveRepository();
