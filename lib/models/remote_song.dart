import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_song.g.dart';
part 'remote_song.freezed.dart';

@freezed
class RemoteSong with _$RemoteSong {
  static double maxProcess = 100;
  const RemoteSong._();

  factory RemoteSong({
    @Default('') @JsonKey(name: 'id') String id,
    @Default('') @JsonKey(name: 'title') String title,
    @Default(0) @JsonKey(name: 'process') double process,
    @Default(false) @JsonKey(name: 'process_now') bool processNow,
  }) = _RemoteSong;

  factory RemoteSong.fromJson(Map<String, dynamic> json) =>
      _$RemoteSongFromJson(json);
}
