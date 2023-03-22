import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/data/model/album.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';

class SearchController extends GetxController {
  SearchController(this._repository);

  final AlbumRepository _repository;

  RxBool isLoading = true.obs;
  RxList<Album> topAlbums = RxList.empty();
  RxList<Album> filteredTopAlbums = RxList.empty();
  final errorMessage = RxnString();
  TextEditingController searchController = TextEditingController();

  void search(String? searchKey) {
    if (searchKey == null || searchKey.isEmpty) {
      filteredTopAlbums.assignAll(topAlbums);
    } else {
      filteredTopAlbums.assignAll(
        topAlbums.where(
          (album) => album.name.toLowerCase().contains(searchKey.toLowerCase()),
        ),
      );
    }
  }

  void clear() {
    searchController.clear();
    filteredTopAlbums.assignAll(topAlbums);
    if (Get.context != null) {
      FocusScope.of(Get.context!).unfocus();
    }
  }

  Future<void> getTopAlbums() async {
    try {
      isLoading(true);
      final response = await _repository.getTopAlbums();
      topAlbums.assignAll(response.albumList);
      filteredTopAlbums.assignAll(response.albumList);
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
