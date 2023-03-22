import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/data/model/album.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';

class HomeController extends GetxController {
  HomeController(this._repository);

  final AlbumRepository _repository;

  final topAlbums = RxList<Album>.empty();
  RxBool isLoading = true.obs;
  final categoryList = RxList<String>.empty();
  final errorMessage = RxnString();

  Future<void> getTopAlbums() async {
    try {
      isLoading(true);
      final response = await _repository.getTopAlbums();
      topAlbums.assignAll(response.albumList);
      categoryList.assignAll(topAlbums.map((e) {
        return e.category.name;
      }).toSet());
      categoryList.sort((a, b) {
        return topAlbums
            .where((p0) => p0.category.name == a)
            .length
            .compareTo(topAlbums.where((p0) => p0.category.name == b).length);
      });

      categoryList.sort((a, b) => a.compareTo(b));
    } on DioError catch (err) {
      switch (err.type) {
        case DioErrorType.connectTimeout:
          errorMessage('connect_timeout_error'.tr);
          break;
        case DioErrorType.receiveTimeout:
          errorMessage('receive_timeout_error'.tr);
          break;
        case DioErrorType.response:
          errorMessage(
            'response_error'.trParams(
              {
                'status_code': err.response!.statusCode.toString(),
              },
            ),
          );
          break;
        case DioErrorType.cancel:
        case DioErrorType.other:
        case DioErrorType.sendTimeout:
          errorMessage(err.message);
          break;
      }
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getTopAlbums();
    ever(errorMessage, (err) {
      if (err != null && err.isNotEmpty) {
        Get.showSnackbar(
          GetSnackBar(
            title: 'error'.tr,
            message: err,
            backgroundColor: Colors.red,
            borderRadius: 8,
            margin: const EdgeInsets.all(16),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });
    super.onInit();
  }
}
