// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) => Photo(
      id: json['id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      promotedAt: json['promoted_at'] as String?,
      width: json['width'] as int,
      height: json['height'] as int,
      color: json['color'] as String,
      blurHash: json['blur_hash'] as String?,
      description: json['description'] as String?,
      altDescription: json['alt_description'] as String?,
      urls: Urls.fromJson(json['urls'] as Map<String, dynamic>),
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      likes: json['likes'] as int,
      likedByUser: json['liked_by_user'] as bool,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'created_at': instance.createdAt,
    'updated_at': instance.updatedAt,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('promoted_at', instance.promotedAt);
  val['color'] = instance.color;
  val['width'] = instance.width;
  val['height'] = instance.height;
  writeNotNull('blur_hash', instance.blurHash);
  writeNotNull('description', instance.description);
  writeNotNull('alt_description', instance.altDescription);
  val['urls'] = instance.urls;
  val['links'] = instance.links;
  val['likes'] = instance.likes;
  val['liked_by_user'] = instance.likedByUser;
  val['user'] = instance.user;
  return val;
}
