import 'package:flutter/material.dart';
import 'package:flutter_app_unsplash/common/widgets/stateless/custom_masonry_gird_photos.dart';
import 'package:flutter_app_unsplash/common/widgets/stateless/loading_hide_keyboard.dart';
import 'package:flutter_app_unsplash/modules/photos/bloc/photos_bloc.dart';
import 'package:flutter_app_unsplash/modules/photos/bloc/photos_state.dart';
import 'package:flutter_app_unsplash/modules/photos/enum/photoEvent.dart';
import 'package:flutter_app_unsplash/utils/extensions/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({Key? key}) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  final _photosBloc = PhotosBloc();

  @override
  void initState() {
    super.initState();
    _photosBloc.add(PhotoEvent.getPhotos);
  }

  @override
  Widget build(BuildContext context) {
    print(_photosBloc.state);
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: NestedScrollView(
        scrollDirection: Axis.vertical,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 30,
                  bottom: 10), //EdgeInsets.all(10),
              child: Column(
                children: [
                  Wrap(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          context.lang('photos'),
                          style: textTheme.headlineLarge,
                        ),
                      ),
                      const SizedBox(
                        width: double.infinity,
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          maxLines: 1,
                          context.lang("sub-photos"),
                          style: textTheme.labelMedium?.copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.grid_view_sharp),
                          ),
                        ),
                      ),
                      SizedBox(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.sort_sharp),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
        body: BlocBuilder<PhotosBloc, PhotosState>(
          buildWhen: (previous, current) => previous.status != current.status,
          bloc: _photosBloc,
          builder: ((context, state) {
            switch (state.status) {
              case StatusType.loading:
                return const LoadingHideKeyboard(
                  size: 30,
                );
              case StatusType.loaded:
                return CustomMasonryGirdPhotos(
                  photos: state.photos,
                  shrinkWrap: true,
                  loadMoreData: (isLoadMore) {
                    if (isLoadMore) {
                      _photosBloc.add(PhotoEvent.getPhotos);
                    }
                  },
                  onRefresh: () async {},
                );
              case StatusType.error:
                return const Center(
                  child: Text('failed to fetch photos'),
                );
              default:
                return const Center(
                  child: Text('failed to fetch photos'),
                );
            }
          }),
        ),
      ),
    );
  }
}
