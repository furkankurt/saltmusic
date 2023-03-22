import 'package:get/get.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/albums/controllers/albums_controller.dart';

class AlbumsBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(AlbumRepository(Get.find()))
      ..put(AlbumsController(Get.find()));
  }
}
