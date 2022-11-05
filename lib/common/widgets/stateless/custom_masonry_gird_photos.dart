import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_unsplash/utils/extensions/extensions.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:unsplash_app/unsplash_app.dart';

import '../../../utils/constants/enum.dart';

class CustomMasonryGirdPhotos extends StatelessWidget {
  const CustomMasonryGirdPhotos(
      {Key? key,
      required this.loadMoreData,
      required this.onRefresh,
      this.shrinkWrap = false,
      required this.photos})
      : super(key: key);
  final Future<void> Function() onRefresh;
  final Function(bool) loadMoreData;
  final bool shrinkWrap;
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        final metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          bool isBottom = metrics.pixels == 0;
          if (!isBottom) {
            loadMoreData(true);
          }
        }
        return true;
      },
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: MasonryGridView.count(
          padding: const EdgeInsets.only(top: 10),
          itemCount: photos.length,
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          shrinkWrap: shrinkWrap,
          mainAxisSpacing: 8,
          itemBuilder: ((context, index) {
            final photo = photos[index];
            //
            final heightImage = context.countHeightPhoto(
                height: photo.height, width: photo.width, crossAxisCount: 2);

            final witdhImage = context.screenSize.width / 2;
            return GestureDetector(
              onTap: () {},
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: witdhImage,
                    height: heightImage,
                    color: photo.color.converterColor,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: photo.urls.photoUrl(LoadQualityType.full),
                      // color: Colors.grey,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
                    ),
                  )),
            );
          }),
        ),
      ),
    );
  }
}
