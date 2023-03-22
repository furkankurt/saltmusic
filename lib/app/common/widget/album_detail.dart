import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:salt_music/app/data/model/album.dart';
import 'package:url_launcher/url_launcher.dart';

class AlbumDetail extends StatelessWidget {
  const AlbumDetail({super.key, required this.album, required this.tag});
  final Album album;
  final String tag;

  @override
  Widget build(BuildContext context) {
    precacheImage(CachedNetworkImageProvider(album.bigImage()), context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Hero(
            tag: tag,
            child: Container(
              height: Get.height,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    album.bigImage(),
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Container(
            height: Get.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
                  Colors.transparent,
                  Colors.black26,
                  Color.fromRGBO(0, 0, 0, 0.9),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 16,
            left: 16,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: album.name,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 34,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(album.link),
                  ),
                  TextSpan(
                    text:
                        '\n${album.category.name} • ${DateFormat('MMM, yyyy').format(album.releaseDate)}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white60,
                          fontWeight: FontWeight.w400,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(album.link),
                  ),
                  TextSpan(
                    text: '\n\nby ${album.artist.name!}\n',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(album.artist.link!),
                  ),
                  TextSpan(
                    text: 'song_count_and_price'.trParams({
                      'count': album.count.toString(),
                      'price': album.price.toString(),
                    }),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _launchUrl(album.link),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}
