import 'package:get/get.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/search/controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(AlbumRepository(Get.find()))
      ..put(SearchController(Get.find()));
  }
}
