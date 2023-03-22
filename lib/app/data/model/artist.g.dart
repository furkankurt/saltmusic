// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
part of 'artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) => Artist(
      name: json['label'] as String?,
      link: Artist._linkFromAttributes(
          json['attributes'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'label': instance.name,
      'attributes': instance.link,
    };
