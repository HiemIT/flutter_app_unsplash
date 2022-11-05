// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      self: json['self'] as String,
      html: json['html'] as String,
      download: json['download'] as String?,
      downloadLocation: json['download_location'] as String?,
      related: json['related'] as String?,
      photos: json['photos'] as String?,
      likes: json['likes'] as String?,
      portfolio: json['portfolio'] as String?,
      following: json['following'] as String?,
      followers: json['followers'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) {
  final val = <String, dynamic>{
    'self': instance.self,
    'html': instance.html,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('download', instance.download);
  writeNotNull('download_location', instance.downloadLocation);
  writeNotNull('related', instance.related);
  writeNotNull('photos', instance.photos);
  writeNotNull('likes', instance.likes);
  writeNotNull('portfolio', instance.portfolio);
  writeNotNull('following', instance.following);
  writeNotNull('followers', instance.followers);
  return val;
}
