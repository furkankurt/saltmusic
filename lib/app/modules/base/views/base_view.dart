import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/modules/albums/views/albums_view.dart';
import 'package:salt_music/app/modules/base/controllers/base_view_controller.dart';
import 'package:salt_music/app/modules/home/views/home_view.dart';
import 'package:salt_music/app/modules/search/views/search_view.dart';

class BaseView extends GetView<BaseViewController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: controller.pageIndex.value,
            children: const [
              HomeView(),
              SearchView(),
              AlbumsView(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.changePage,
          currentIndex: controller.pageIndex.value,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home_outlined,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: Icons.search_outlined,
              label: 'Search',
            ),
            _bottomNavigationBarItem(
              icon: Icons.album_outlined,
              label: 'Albums',
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      {required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      tooltip: label,
    );
  }
}
