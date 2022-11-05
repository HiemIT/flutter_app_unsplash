// how to import model Photo from package unsplash_app
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_app_unsplash/common/network/dio_client.dart';
import "package:unsplash_app/src/models/photo.dart" show Photo;

class ListPhotosRepo {
  static const ACCESS_KEY = 'xhXGas_4TlKhO8I6TrIbG5ndL3oU5VB915x0-1TPSGc';

  Future<List<Photo>?> getPhotos() async {
    try {
      // https://api.unsplash.com/photos/?per_page=30&order_by=${orderBy.value}&client_id=$apikey"
      final response = await DioService().getMethod(
          "https://api.unsplash.com/photos/?per_page=30&order_by=popular&client_id=$ACCESS_KEY");

      if (response.statusCode == 200) {
        final photos = (response.data as List)
            .map((e) => Photo.fromJson(e as Map<String, dynamic>))
            .toList();
        return photos;
      }
    } catch (e) {
      rethrow;
    }
  }
}

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      final photos = (response.data as List)
          .map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList();
      log(photos.toString());
      log(response.toString());
      return response;
    });
  }
}

enum PhotosOrderBy { latest, oldest, popular }

abstract class PhotosAbs {
  Future<List<Photo>> getPhotos({
    int page = 1,
    int perPage = 10,
    PhotosOrderBy orderBy = PhotosOrderBy.latest,
  });
}

class Photos extends PhotosAbs {
  Photos(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<List<Photo>> getPhotos(
      {int page = 1,
      int perPage = 10,
      PhotosOrderBy orderBy = PhotosOrderBy.latest}) async {
    final data = await _dioClient.get('/photos', queryParameters: {
      "page": page,
      "per_page": perPage,
      "order_by": orderBy.name,
    });
    return (data as List)
        .map((e) => Photo.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
