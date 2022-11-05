import 'package:flutter/material.dart';
import 'package:flutter_app_unsplash/modules/photos/bloc/photos_bloc.dart';
import 'package:flutter_app_unsplash/modules/photos/enum/photoEvent.dart';
import 'package:flutter_app_unsplash/modules/photos/page/photos_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoView extends StatelessWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotosBloc()..add(PhotoEvent.getPhotos),
      child: const PhotosPage(),
    );
  }
}
