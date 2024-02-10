import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveRepository<K, T> {
  final String boxKey;
  Box<String>? box;

  HiveRepository({this.boxKey = 'appBox'});

  static Future<void> hiveInitial() async {
    await Hive.initFlutter();
  }

  Future<void> initial() async {
    if (Hive.isBoxOpen(boxKey) != true) {
      await Hive.initFlutter();
    }

    box = await Hive.openBox<String>(boxKey);
  }

  Future<Box<String>> getBox() async {
    if (box == null || box?.isOpen == false) {
      await initial();
    }
    return box!;
  }

  Future<List<String>> getList() async {
    if (box == null || box?.isOpen != true) {
      return [];
    }

    return box!.values.toList();
  }

  Future<String?> get(K key) async {
    if (box == null || box?.isOpen != true) {
      return null;
    }

    return box!.get(key);
  }

  Future<void> put(K key, String value) async {
    if (box == null || box?.isOpen != true) {
      return;
    }

    return box!.put(key, value);
  }

  Future<void> clean() async {
    if (box == null || box?.isOpen != true) {
      return;
    }

    box!.clear();
  }
}
