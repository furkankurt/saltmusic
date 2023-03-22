import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salt_music/app/common/widget/album_detail.dart';
import 'package:salt_music/app/data/model/album.dart';

import '../fixtures/fixture_reader.dart';

void main() {
  late Album album;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    album = topAlbums().albumList.first;
  });

  group('AlbumDetail Widget Test', () {
    testWidgets('Renders the AlbumDetail properly', (widgetTester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await widgetTester.pumpWidget(
        MaterialApp(
          home: AlbumDetail(
            album: album,
            tag: 'albumTag',
          ),
        ),
      );
      await widgetTester.pumpAndSettle();
    });
  });
}
