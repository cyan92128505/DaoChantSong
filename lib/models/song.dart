import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class SongItem with _$SongItem {
  const SongItem._();

  const factory SongItem({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'title') String title,
    @Default('') @JsonKey(name: 'filePath') String filePath,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SongItem;

  factory SongItem.fromJson(Map<String, dynamic> json) =>
      _$SongItemFromJson(json);

  static String getCustomUniqueId({int length = 6}) {
    const String pushChars = '0123456789ABCDEF';

    var lastRandChars = <int>[];

    var uniqueId = '';

    for (int i = 0; i < length; i++) {
      lastRandChars
          .add((Random().nextDouble() * (pushChars.length - 1)).floor());
    }

    for (int i = 0; i < length; i++) {
      uniqueId += pushChars[lastRandChars[i]];
    }

    return uniqueId;
  }
}
