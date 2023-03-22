import 'package:json_annotation/json_annotation.dart';

part 'artist.g.dart';

@JsonSerializable(explicitToJson: true)
class Artist {
  Artist({
    this.name,
    this.link,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(name: 'label')
  final String? name;
  @JsonKey(name: 'attributes', fromJson: _linkFromAttributes)
  final String? link;

  /// Connect the generated [_$ArtistFromJson] function to the `fromJson`
  /// factory.
  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  /// Connect the generated [_$ArtistToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ArtistToJson(this);

  static String? _linkFromAttributes(Map<String, dynamic>? json) {
    return json?['href'] as String?;
  }
}
