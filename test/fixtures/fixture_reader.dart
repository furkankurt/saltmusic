import 'dart:convert';
import 'dart:io';

import 'package:salt_music/app/data/model/album_response.dart';

String fixture(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  return File('$dir/test/fixtures/$name').readAsStringSync();
}

AlbumResponse topAlbums({String name = 'albums.json'}) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  final file = File('$dir/test/fixtures/$name').readAsStringSync();
  return AlbumResponse.fromJson(json.decode(file) as Map<String, dynamic>);
}
