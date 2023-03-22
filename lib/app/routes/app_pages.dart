import 'package:get/get.dart';
import 'package:salt_music/app/modules/albums/bindings/albums_binding.dart';
import 'package:salt_music/app/modules/albums/views/albums_view.dart';
import 'package:salt_music/app/modules/base/bindings/base_view_binding.dart';
import 'package:salt_music/app/modules/base/views/base_view.dart';
import 'package:salt_music/app/modules/home/bindings/home_binding.dart';
import 'package:salt_music/app/modules/home/views/home_view.dart';
import 'package:salt_music/app/modules/search/bindings/search_binding.dart';
import 'package:salt_music/app/modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.base;

  static final routes = [
    GetPage(
      name: _Paths.base,
      page: () => const BaseView(),
      bindings: [
        HomeBinding(),
        SearchBinding(),
        AlbumsBinding(),
        BaseViewBinding(),
      ],
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.albums,
      page: () => const AlbumsView(),
      binding: AlbumsBinding(),
    ),
  ];
}
