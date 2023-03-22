import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salt_music/app/common/widget/album_detail.dart';
import 'package:salt_music/app/data/model/album.dart';

class AlbumListItem extends StatelessWidget {
  const AlbumListItem({super.key, required this.album, required this.tag});

  final Album album;
  final String tag;

  @override
  Widget build(BuildContext context) {
    precacheImage(CachedNetworkImageProvider(album.bigImage()), context);
    return ListTile(
      onTap: () => Get.to(() => AlbumDetail(album: album, tag: tag)),
      title: Text(album.name),
      subtitle: Text('${album.artist.name}'),
      trailing: Text(
        '${album.category.name}\n${DateFormat.y().format(album.releaseDate)}',
        textAlign: TextAlign.end,
      ),
      leading: SizedBox(
        width: 40,
        height: 40,
        child: Hero(
          tag: tag,
          child: CachedNetworkImage(
            imageUrl: album.image,
            errorWidget: (_, __, ___) =>
                const Icon(Icons.error_outline).paddingAll(8),
            imageBuilder: (_, image) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: image,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
