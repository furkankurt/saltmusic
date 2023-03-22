import 'package:get/get.dart';
import 'package:salt_music/app/modules/base/controllers/base_view_controller.dart';

class BaseViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseViewController>(
      () => BaseViewController(),
    );
  }
}
