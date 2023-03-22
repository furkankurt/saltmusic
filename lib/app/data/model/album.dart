import 'package:json_annotation/json_annotation.dart';
import 'package:salt_music/app/common/helper/json_converter.dart';
import 'package:salt_music/app/data/model/artist.dart';
import 'package:salt_music/app/data/model/category.dart';

part 'album.g.dart';

@JsonSerializable(explicitToJson: true)
class Album {
  Album({
    required this.id,
    required this.name,
    required this.image,
    required this.count,
    required this.price,
    required this.rights,
    required this.title,
    required this.link,
    required this.category,
    required this.artist,
    required this.releaseDate,
  });

  /// The generated code assumes these values exist in JSON.
  @JsonKey(name: 'id', includeFromJson: true)
  @IdConverter()
  final int id;

  @JsonKey(name: 'im:name')
  @LabelConverter()
  final String name;

  @JsonKey(name: 'im:image', fromJson: _imageFromJson)
  final String image;

  @JsonKey(name: 'im:itemCount')
  @ItemCountConverter()
  final int count;

  @JsonKey(name: 'im:price')
  @PriceConverter()
  final double price;

  @LabelConverter()
  final String rights;

  @LabelConverter()
  final String title;

  @LinkConverter()
  final String link;

  @JsonKey(fromJson: _categoryFromJson)
  final Category category;

  @JsonKey(name: 'im:artist')
  final Artist artist;

  @JsonKey(name: 'im:releaseDate')
  @DateConverter()
  final DateTime releaseDate;

  /// Connect the generated [_$AlbumFromJson] function to the `fromJson`
  /// factory.
  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  /// Connect the generated [_$AlbumToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AlbumToJson(this);

  static String _imageFromJson(img) {
    final imageUrl = img.first['label'] as String;
    return imageUrl.replaceAll('55x55bb', '300x300bb');
  }

  static Category _categoryFromJson(Map<String, dynamic> cat) {
    return Category.fromJson(cat['attributes'] as Map<String, dynamic>);
  }

  String bigImage() {
    return image.replaceAll('300x300bb', '1000x1000bb');
  }
}
