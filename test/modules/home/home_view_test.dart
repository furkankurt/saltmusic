import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/home/controllers/home_controller.dart';
import 'package:salt_music/app/modules/home/views/home_view.dart';

import '../../fixtures/fixture_reader.dart';
import 'home_controller_test.mocks.dart';

@GenerateMocks(
  [
    AlbumRepository,
  ],
)
void main() {
  late HomeController homeController;
  late AlbumRepository albumRepository;
  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    albumRepository = MockAlbumRepository();
    when(albumRepository.getTopAlbums()).thenAnswer(
      (_) async => Future.value(topAlbums()),
    );
    homeController = HomeController(albumRepository);
    Get.put<HomeController>(homeController);
  });

  group('HomeView Widget Test', () {
    testWidgets('Renders the HomeView properly', (widgetTester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      await widgetTester.pumpWidget(const MaterialApp(home: HomeView()));
      await widgetTester.pumpAndSettle();
    });
  });
}
