import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/albums/controllers/albums_controller.dart';
import 'package:salt_music/app/modules/albums/views/albums_view.dart';

import '../../fixtures/fixture_reader.dart';
import 'albums_view_test.mocks.dart';

@GenerateMocks(
  [
    AlbumRepository,
  ],
)
void main() {
  late AlbumsController albumsController;
  late AlbumRepository albumRepository;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    albumRepository = MockAlbumRepository();
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );
    albumsController = AlbumsController(albumRepository);
    Get.put<AlbumsController>(albumsController);
  });

  group('AlbumsView Widget Test', () {
    testWidgets('Renders the AlbumsView properly', (widgetTester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await widgetTester.pumpWidget(const MaterialApp(home: AlbumsView()));
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byIcon(Icons.filter_list));
      await widgetTester.pumpAndSettle();
    });
  });
}
