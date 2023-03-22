import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    required this.name,
    required this.id,
    required this.link,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(name: 'im:id', fromJson: _idFromJson)
  final int id;
  @JsonKey(name: 'label')
  final String name;
  @JsonKey(name: 'scheme')
  final String link;

  /// Connect the generated [_$CategoryFromJson] function to the `fromJson`
  /// factory.
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  /// Connect the generated [_$_CategoryToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  static int _idFromJson(String json) {
    return int.parse(json);
  }
}
