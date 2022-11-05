import 'package:json_annotation/json_annotation.dart';
import 'package:unsplash_app/src/models/link.dart';
import 'package:unsplash_app/src/models/urls.dart';
import 'package:unsplash_app/src/models/user.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: 'id', includeIfNull: false)
  final String id;

  @JsonKey(name: 'created_at', includeIfNull: false)
  final String createdAt;

  @JsonKey(name: 'updated_at', includeIfNull: false)
  final String updatedAt;

  @JsonKey(name: 'promoted_at', includeIfNull: false)
  final String? promotedAt;

  @JsonKey(name: 'color', includeIfNull: false)
  final String color;

  @JsonKey(name: 'width', includeIfNull: false)
  final int width;

  @JsonKey(name: 'height', includeIfNull: false)
  final int height;

  @JsonKey(name: 'blur_hash', includeIfNull: false)
  final String? blurHash;

  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;

  @JsonKey(name: 'alt_description', includeIfNull: false)
  final String? altDescription;

  @JsonKey(name: 'urls', includeIfNull: false)
  final Urls urls;
  @JsonKey(name: 'links', includeIfNull: false)
  final Links links;
  @JsonKey(name: 'likes', includeIfNull: false)
  final int likes;
  @JsonKey(name: 'liked_by_user', includeIfNull: false)
  final bool likedByUser;

  @JsonKey(name: 'user', includeIfNull: false)
  final User user;

  Photo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.user,
  });

  Photo copyWith({
    String? id,
    String? createdAt,
    String? updatedAt,
    String? promotedAt,
    int? width,
    int? height,
    String? color,
    String? blurHash,
    int? downloads,
    String? description,
    String? altDescription,
    Urls? urls,
    required Links links,
    int? likes,
    bool? likedByUser,
    User? user,
  }) {
    return Photo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      promotedAt: promotedAt ?? this.promotedAt,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      blurHash: blurHash ?? this.blurHash,
      description: description ?? this.description,
      altDescription: altDescription ?? this.altDescription,
      urls: urls ?? this.urls,
      links: links ?? this.links,
      likes: likes ?? this.likes,
      likedByUser: likedByUser ?? this.likedByUser,
      user: user ?? this.user,
    );
  }

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
