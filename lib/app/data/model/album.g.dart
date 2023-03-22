// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      id: const IdConverter().fromJson(json['id'] as Map<String, dynamic>),
      name: const LabelConverter()
          .fromJson(json['im:name'] as Map<String, dynamic>),
      image: Album._imageFromJson(json['im:image']),
      count: const ItemCountConverter()
          .fromJson(json['im:itemCount'] as Map<String, dynamic>),
      price: const PriceConverter()
          .fromJson(json['im:price'] as Map<String, dynamic>),
      rights: const LabelConverter()
          .fromJson(json['rights'] as Map<String, dynamic>),
      title: const LabelConverter()
          .fromJson(json['title'] as Map<String, dynamic>),
      link:
          const LinkConverter().fromJson(json['link'] as Map<String, dynamic>),
      category:
          Album._categoryFromJson(json['category'] as Map<String, dynamic>),
      artist: Artist.fromJson(json['im:artist'] as Map<String, dynamic>),
      releaseDate: const DateConverter()
          .fromJson(json['im:releaseDate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'im:name': const LabelConverter().toJson(instance.name),
      'im:image': instance.image,
      'im:itemCount': const ItemCountConverter().toJson(instance.count),
      'im:price': const PriceConverter().toJson(instance.price),
      'rights': const LabelConverter().toJson(instance.rights),
      'title': const LabelConverter().toJson(instance.title),
      'link': const LinkConverter().toJson(instance.link),
      'category': instance.category.toJson(),
      'im:artist': instance.artist.toJson(),
      'im:releaseDate': const DateConverter().toJson(instance.releaseDate),
    };
