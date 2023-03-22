// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
part of 'album_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumResponse _$AlbumResponseFromJson(Map<String, dynamic> json) =>
    AlbumResponse(
      AlbumResponse._albumListFromJson(json['feed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumResponseToJson(AlbumResponse instance) =>
    <String, dynamic>{
      'feed': instance.albumList,
    };
