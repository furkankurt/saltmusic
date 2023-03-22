import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class BaseViewController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changePage(int index) => pageIndex(index);
  
  @override
  void onInit() {
    FlutterNativeSplash.remove();
    super.onInit();
  }
}
