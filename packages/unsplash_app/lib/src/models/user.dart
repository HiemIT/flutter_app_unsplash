import 'package:json_annotation/json_annotation.dart';
import 'package:unsplash_app/src/models/link.dart';
import 'package:unsplash_app/src/models/profile_image.dart';
import 'package:unsplash_app/src/models/social.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id', includeIfNull: false)
  final String id;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  final String updatedAt;
  @JsonKey(name: 'username', includeIfNull: false)
  final String username;

  @JsonKey(name: 'name', includeIfNull: false)
  final String name;
  @JsonKey(name: 'first_name', includeIfNull: false)
  final String? firstName;
  @JsonKey(name: 'last_name', includeIfNull: false)
  final String? lastName;
  @JsonKey(name: 'twitter_username', includeIfNull: false)
  final String? twitterUsername;

  @JsonKey(name: 'portfolio_url', includeIfNull: false)
  final String? portfolioUrl;
  @JsonKey(name: 'bio', includeIfNull: false)
  final String? bio;
  @JsonKey(name: 'location', includeIfNull: false)
  final String? location;
  @JsonKey(name: 'links', includeIfNull: false)
  final Links links;

  @JsonKey(name: 'profile_image', includeIfNull: false)
  final ProfileImage profileImage;
  @JsonKey(name: 'instagram_username', includeIfNull: false)
  final String? instagramUsername;
  @JsonKey(name: 'total_collections', includeIfNull: false)
  final int totalCollections;
  @JsonKey(name: 'total_likes', includeIfNull: false)
  final int totalLikes;

  @JsonKey(name: 'total_photos', includeIfNull: false)
  final int totalPhotos;
  @JsonKey(name: 'accepted_tos', includeIfNull: false)
  final bool acceptedTos;
  @JsonKey(name: 'for_hire', includeIfNull: false)
  final bool forHire;
  @JsonKey(name: 'social', includeIfNull: false)
  final Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    required this.links,
    required this.profileImage,
    this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
