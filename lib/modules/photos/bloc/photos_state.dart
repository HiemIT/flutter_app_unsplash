import 'package:equatable/equatable.dart';
import 'package:flutter_app_unsplash/modules/photos/enum/photoEvent.dart';
import 'package:flutter_app_unsplash/modules/photos/repos/list_photos_repo.dart';
import 'package:unsplash_app/unsplash_app.dart';

class PhotosState extends Equatable {
  final List<Photo> photos;
  final StatusType status;
  final PhotosOrderBy orderBy;

  const PhotosState({
    this.photos = const [],
    this.status = StatusType.initial,
    this.orderBy = PhotosOrderBy.latest,
  });

  // khoi tao copyWith de copy state moi tu state cu va thay doi cac gia tri can thay doi trong state moi
  PhotosState copyWith({
    List<Photo>? photos,
    StatusType? status,
    PhotosOrderBy? orderBy,
  }) =>
      PhotosState(
        photos: photos ?? this.photos,
        status: status ?? this.status,
        orderBy: orderBy ?? this.orderBy,
      );

  @override
  List<Object> get props => [photos, status, orderBy];
}
