import 'package:dao/repositories/local_storage/local_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'first_open_app.g.dart';

@Riverpod(keepAlive: true)
class FirstOpenApp extends _$FirstOpenApp {
  @override
  bool build() {
    return LocalStorageBool.firstOpenApp().value;
  }

  LocalStorage store() {
    return LocalStorageBool.firstOpenApp();
  }

  Future<void> setup(bool value) async {
    await LocalStorageBool.firstOpenApp().update(value);
    state = value;
  }

  void clean() {
    LocalStorageBool.firstOpenApp().clean();
    state = LocalStorageBool.firstOpenApp().defaultValue;
  }
}
