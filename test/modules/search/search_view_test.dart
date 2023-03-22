import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/search/controllers/search_controller.dart';
import 'package:salt_music/app/modules/search/views/search_view.dart';

import '../../fixtures/fixture_reader.dart';
import 'search_view_test.mocks.dart';

@GenerateMocks(
  [
    AlbumRepository,
  ],
)
void main() {
  late SearchController searchController;
  late AlbumRepository albumRepository;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    albumRepository = MockAlbumRepository();
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );
    searchController = SearchController(albumRepository);
    Get.put<SearchController>(searchController);
  });

  group('SearchView Widget Test', () {
    testWidgets('Renders the SearchView properly', (widgetTester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await widgetTester.pumpWidget(const MaterialApp(home: SearchView()));
      await widgetTester.pumpAndSettle();
    });
  });
}
