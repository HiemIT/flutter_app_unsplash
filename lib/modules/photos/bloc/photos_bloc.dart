import 'package:flutter_app_unsplash/modules/photos/bloc/photos_state.dart';
import 'package:flutter_app_unsplash/modules/photos/enum/photoEvent.dart';
import 'package:flutter_app_unsplash/modules/photos/repos/list_photos_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsplash_app/unsplash_app.dart';

class PhotosBloc extends Bloc<PhotoEvent, PhotosState> {
  PhotosBloc() : super(const PhotosState()) {
    on<PhotoEvent>(
      (event, emit) async {
        switch (event) {
          case PhotoEvent.getPhotos:
            try {
              emit(const PhotosState(status: StatusType.loading));
              final res = await ListPhotosRepo().getPhotos();
              if (res != null) {
                emit(state.copyWith(photos: res, status: StatusType.loaded));
              }
            } catch (e) {
              emit(state.copyWith(status: StatusType.error));
            }
            break;
          default:
            break;
        }
      },
    );
  }
}

class ListPhotosState {
  final Object? error;
  final List<Photo>? photos;

  ListPhotosState({
    this.error,
    this.photos,
  });

  ListPhotosState copyWith({
    Object? error,
    List<Photo>? posts,
  }) =>
      ListPhotosState(
        error: error ?? this.error,
        photos: posts ?? this.photos,
      );
}
