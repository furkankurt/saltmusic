import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/common/extension/widget_extensions.dart';
import 'package:salt_music/app/common/widget/album_list_item.dart';
import 'package:salt_music/app/modules/search/controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const CircularProgressIndicator().toCenter()
            : listView(context),
      ),
    );
  }

  Widget listView(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        SliverAppBar(
          title: Text('search'.tr),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: SizedBox(
              height: kToolbarHeight,
              child: TextField(
                controller: controller.searchController,
                onChanged: controller.search,
                focusNode: FocusNode(canRequestFocus: false),
                decoration: InputDecoration(
                  hintText: 'search'.tr,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () => controller.clear(),
                    icon: const Icon(Icons.clear),
                  ),
                  //borders
                  contentPadding: const EdgeInsets.all(8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: Theme.of(context).canvasColor,
                    ),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ).marginSymmetric(
                horizontal: 12,
              ),
            ),
          ),
          floating: true,
        ),
        if (controller.filteredTopAlbums.isEmpty)
          SliverFillRemaining(
              child: Text(
            'no_results_found_for'.trParams(
              {
                'field': controller.searchController.text,
              },
            ),
          ).toCenter()),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.filteredTopAlbums.length,
                itemBuilder: (_, i) {
                  final album = controller.filteredTopAlbums[i];
                  return AlbumListItem(
                    album: album,
                    tag: 'albumImage2${album.id}',
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
