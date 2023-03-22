import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/albums/controllers/albums_controller.dart';
import 'package:salt_music/app/modules/base/controllers/base_view_controller.dart';
import 'package:salt_music/app/modules/base/views/base_view.dart';
import 'package:salt_music/app/modules/home/controllers/home_controller.dart';
import 'package:salt_music/app/modules/search/controllers/search_controller.dart';

import '../../fixtures/fixture_reader.dart';
import 'base_view_test.mocks.dart';

@GenerateMocks(
  [
    AlbumRepository,
  ],
)
void main() {
  late BaseViewController baseViewController;
  late AlbumRepository repository;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    repository = MockAlbumRepository();
    when(repository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );
    baseViewController = BaseViewController();
    Get.put<HomeController>(HomeController(repository));
    Get.put<SearchController>(SearchController(repository));
    Get.put<AlbumsController>(AlbumsController(repository));
    Get.put<BaseViewController>(baseViewController);
  });

  group('BaseView Widget Test', () {
    testWidgets('Renders the BaseView properly', (widgetTester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await widgetTester.pumpWidget(const MaterialApp(home: BaseView()));
      await widgetTester.pumpAndSettle();
    });
  });
}
