import 'package:get/get.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';
import 'package:salt_music/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..put(AlbumRepository(Get.find()))
      ..put(HomeController(Get.find()));
  }
}
