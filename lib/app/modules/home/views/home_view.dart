import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/common/constants/app_constants.dart';
import 'package:salt_music/app/common/extension/widget_extensions.dart';
import 'package:salt_music/app/common/widget/album_square_item.dart';
import 'package:salt_music/app/data/model/album.dart';
import 'package:salt_music/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home'.tr),
        actions: [
          IconButton(
              onPressed: () => Get.changeThemeMode(
                  Theme.of(context).brightness == Brightness.dark
                      ? ThemeMode.light
                      : ThemeMode.dark),
              icon: Theme.of(context).brightness == Brightness.dark
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const CircularProgressIndicator().toCenter()
            : listView(context),
      ),
    );
  }

  Widget listView(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'welcome_to'.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextSpan(
                text: '${AppConstants.appName}\n',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
              ),
              TextSpan(
                text: 'welcome_description'.tr,
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).colorScheme.onBackground.withAlpha(20),
          indent: 16,
          endIndent: 16,
        ).paddingSymmetric(vertical: 8),
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.categoryList.length,
          itemBuilder: (_, i) {
            final category = controller.categoryList[i];
            final albums = controller.topAlbums
                .where((p0) => p0.category.name == category)
                .toList();
            return albumsByCategory(context, category, albums);
          },
        ),
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  Column albumsByCategory(
      BuildContext context, String category, List<Album> albums) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: Theme.of(context).textTheme.titleLarge,
        ).toAlign(Alignment.centerLeft).marginOnly(bottom: 12),
        SizedBox(
          height: 220,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            separatorBuilder: (_, i) => const SizedBox(width: 12),
            itemCount: albums.length,
            itemBuilder: (_, i) {
              final album = albums[i];
              return AlbumSquareItem(
                album: album,
                tag: 'albumImage${album.id}',
              );
            },
          ),
        ),
      ],
    );
  }
}
