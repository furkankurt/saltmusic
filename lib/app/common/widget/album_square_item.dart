import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salt_music/app/common/widget/album_detail.dart';
import 'package:salt_music/app/data/model/album.dart';

class AlbumSquareItem extends StatelessWidget {
  const AlbumSquareItem({super.key, required this.album, required this.tag});

  final Album album;
  final String tag;

  @override
  Widget build(BuildContext context) {
    precacheImage(CachedNetworkImageProvider(album.bigImage()), context);
    return GestureDetector(
      onTap: () => Get.to(() => AlbumDetail(album: album, tag: tag)),
      child: SizedBox(
        height: 180,
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: tag,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      album.image,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              album.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              album.artist.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
