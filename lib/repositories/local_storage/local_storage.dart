import 'package:shared_preferences/shared_preferences.dart';

enum LocalStorageKey {
  firstOpenApp('firstOpenApp');

  const LocalStorageKey(this.name);
  final String name;
}

sealed class LocalStorage<T> {
  LocalStorage({
    required this.prefKey,
    required this.defaultValue,
    this.mapFrom,
    this.mapTo,
  });

  final String prefKey;
  final T defaultValue;

  T Function(String?)? mapFrom;
  String Function(T)? mapTo;

  static SharedPreferences? prefs;
  static Future<void> initial() async {
    prefs = await SharedPreferences.getInstance();
  }

  T get value {
    if (prefs == null) {
      return defaultValue;
    }

    if (mapFrom == null) {
      return prefs!.get(prefKey) as T? ?? defaultValue;
    }

    var result = prefs!.getString(prefKey);

    if (result == null) {
      return defaultValue;
    }

    return mapFrom!(result);
  }

  set value(T setupValue) {
    update(setupValue);
  }

  Future<T> update(T value) async {
    if (prefs == null) {
      return defaultValue;
    }
    if (value is String) {
      await prefs!.setString(prefKey, value);
    } else if (value is bool) {
      await prefs!.setBool(prefKey, value);
    } else if (value is int) {
      await prefs!.setInt(prefKey, value);
    } else if (value is double) {
      await prefs!.setDouble(prefKey, value);
    } else if (value is List<String>) {
      await prefs!.setStringList(prefKey, value);
    } else if (mapTo != null) {
      final rawValue = mapTo!(value);
      await prefs!.setString(prefKey, rawValue);
    }

    return value;
  }

  void clean() {
    value = defaultValue;
  }
}

class LocalStorageBool extends LocalStorage<bool> {
  LocalStorageBool({
    required super.prefKey,
    required super.defaultValue,
  });

  LocalStorageBool.firstOpenApp()
      : super(
          defaultValue: true,
          prefKey: LocalStorageKey.firstOpenApp.name,
        );
}
