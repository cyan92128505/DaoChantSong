import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:dao/configs/env.dart';
import 'package:dao/models/remote_song.dart';

part 'remote_song_repository.g.dart';
part 'remote_song_repository.freezed.dart';

@freezed
class RemoteSongResponse with _$RemoteSongResponse {
  factory RemoteSongResponse({
    @Default([]) @JsonKey(name: 'data') List<RemoteSong> data,
  }) = _RemoteSongResponse;

  factory RemoteSongResponse.fromJson(Map<String, dynamic> json) =>
      _$RemoteSongResponseFromJson(json);
}

class RemoteSongRepository {
  static Future<List<RemoteSong>> getTestData() async {
    final url = Uri.parse(EnvConfig.testDataAPI);

    // Await the http get response, then decode the json-formatted response.
    var res = await get(url);
    if (res.statusCode == 200) {
      var jsonData =
          jsonDecode(utf8.decode(res.bodyBytes)) as Map<String, dynamic>;

      return RemoteSongResponse.fromJson(jsonData).data;
    } else {
      return [];
    }
  }
}
