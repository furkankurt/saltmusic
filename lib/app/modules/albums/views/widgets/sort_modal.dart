import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/modules/albums/controllers/albums_controller.dart';

class SortModal extends StatelessWidget {
  const SortModal({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AlbumsController>(
        builder: (controller) => ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.close,
                      size: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.selectSortType(null);
                      Get.back();
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  title: Text(
                    'sort_the_albums'.tr,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                ).marginSymmetric(vertical: 8),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (_, i) {
                    final sortType = controller.sortList.keys.elementAt(i);
                    final title =
                        controller.sortList[sortType]!['title'] as String;
                    final icon =
                        controller.sortList[sortType]!['icon'] as IconData;
                    final selected =
                        controller.selectedSortType.value == sortType;
                    return ListTile(
                      title: Text(
                        title,
                        style: const TextStyle(fontSize: 14),
                      ),
                      horizontalTitleGap: 4,
                      leading: Icon(
                        icon,
                        color: selected
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                      trailing: selected
                          ? Icon(Icons.check,
                              color: Theme.of(context).colorScheme.primary)
                          : null,
                      onTap: () {
                        controller.selectSortType(sortType);
                        Get.back();
                      },
                    );
                  },
                  itemCount: controller.sortList.keys.length,
                ),
              ],
            ));
  }
}
