// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['label'] as String,
      id: Category._idFromJson(json['im:id'] as String),
      link: json['scheme'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'im:id': instance.id,
      'label': instance.name,
      'scheme': instance.link,
    };
