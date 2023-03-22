import 'package:json_annotation/json_annotation.dart';
import 'package:salt_music/app/data/model/album.dart';

part 'album_response.g.dart';

@JsonSerializable()
class AlbumResponse {
  const AlbumResponse(this.albumList);

  @JsonKey(name: 'feed', fromJson: _albumListFromJson)
  final List<Album> albumList;

  factory AlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumResponseToJson(this);

  static List<Album> _albumListFromJson(
    Map<String, dynamic> json,
  ) {
    final list = json['entry'].cast<Map<String, dynamic>>()
        as List<Map<String, dynamic>>;
    return list.map((e) => Album.fromJson(e)).toList();
  }
}
