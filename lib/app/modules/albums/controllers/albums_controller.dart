import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/data/model/album.dart';
import 'package:salt_music/app/data/repository/album_repository.dart';

enum SortType {
  nameAsc,
  nameDesc,
  dateAsc,
  dateDesc,
  shuffle,
}

class AlbumsController extends GetxController {
  AlbumsController(this._repository);

  final AlbumRepository _repository;

  RxBool isLoading = true.obs;
  final errorMessage = RxnString();
  RxList<Album> topAlbums = RxList.empty();
  RxList<Album> sortedTopAlbums = RxList.empty();
  Map<SortType, Map<String, dynamic>> sortList = {
    SortType.nameAsc: {
      'title': 'sort_name_asc'.tr,
      'icon': Icons.sort_by_alpha,
    },
    SortType.nameDesc: {
      'title': 'sort_name_desc'.tr,
      'icon': Icons.sort_by_alpha,
    },
    SortType.dateAsc: {
      'title': 'sort_date_asc'.tr,
      'icon': Icons.calendar_today,
    },
    SortType.dateDesc: {
      'title': 'sort_date_desc'.tr,
      'icon': Icons.calendar_today,
    },
    SortType.shuffle: {
      'title': 'shuffle'.tr,
      'icon': Icons.shuffle,
    },
  };
  Rxn<SortType> selectedSortType = Rxn();

  void selectSortType(SortType? sortType) {
    switch (sortType) {
      case null:
        sortedTopAlbums.assignAll(topAlbums);
        break;
      case SortType.nameAsc:
        sortedTopAlbums.sort((a, b) => a.name.compareTo(b.name));
        break;
      case SortType.nameDesc:
        sortedTopAlbums.sort((a, b) => b.name.compareTo(a.name));
        break;
      case SortType.dateAsc:
        sortedTopAlbums.sort((a, b) => a.releaseDate.compareTo(b.releaseDate));
        break;
      case SortType.dateDesc:
        sortedTopAlbums.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
        break;
      case SortType.shuffle:
        sortedTopAlbums.shuffle();
        break;
    }
    selectedSortType.value = sortType == SortType.shuffle ? null : sortType;
    selectedSortType.refresh();
  }

  Future<void> getTopAlbums() async {
    try {
      isLoading(true);
      final response = await _repository.getTopAlbums();
      topAlbums.assignAll(response.albumList);
      sortedTopAlbums.assignAll(response.albumList);
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
