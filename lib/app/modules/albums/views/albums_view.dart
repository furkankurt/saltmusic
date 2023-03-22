import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/common/extension/widget_extensions.dart';
import 'package:salt_music/app/common/widget/album_list_item.dart';
import 'package:salt_music/app/modules/albums/controllers/albums_controller.dart';
import 'package:salt_music/app/modules/albums/views/widgets/sort_modal.dart';

class AlbumsView extends GetView<AlbumsController> {
  const AlbumsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('albums'.tr),
        actions: [
          IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                    context: context, builder: (_) => const SortModal());
              },
              icon: const Icon(Icons.filter_list))
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
    return RefreshIndicator(
      onRefresh: () => controller.getTopAlbums(),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: controller.sortedTopAlbums.length,
        itemBuilder: (_, i) {
          final album = controller.sortedTopAlbums[i];
          return AlbumListItem(
            album: album,
            tag: 'albumImage3${album.id}',
          );
        },
      ),
    );
  }
}
