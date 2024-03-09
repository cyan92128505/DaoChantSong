import 'package:dao/providers/local_storage/first_open_app.dart';
import 'package:dao/repositories/local_storage/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_storage.g.dart';

final List<LocalStorage> _localStorageList = [
  LocalStorageBool.firstOpenApp(),
];

@Riverpod(keepAlive: true)
class LocalStorageList extends _$LocalStorageList {
  @override
  List<Object> build() {
    ref.read(firstOpenAppProvider);
    return _localStorageList;
  }

  void cleanAllLocalStorages() {
    ref.read(firstOpenAppProvider.notifier).clean();
  }
}
