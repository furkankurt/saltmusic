import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/data/service/interceptors.dart';
import 'package:salt_music/app/data/service/rest_client.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get
      ..put(Dio()..interceptors.addAll(interceptors))
      ..put(RestClient(Get.find()));
  }
}
