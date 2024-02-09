import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';
part 'song.g.dart';

@freezed
class SongItem with _$SongItem {
  const SongItem._();

  const factory SongItem({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'display_name') String displayName,
    @Default('') @JsonKey(name: 'url') String url,
    @Default(null) @JsonKey(name: 'created_at') DateTime? createdAt,
    @Default(null) @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _SongItem;

  factory SongItem.fromJson(Map<String, dynamic> json) =>
      _$SongItemFromJson(json);
}
