// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      updatedAt: json['updated_at'] as String,
      username: json['username'] as String,
      name: json['name'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      twitterUsername: json['twitter_username'] as String?,
      portfolioUrl: json['portfolio_url'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
      profileImage:
          ProfileImage.fromJson(json['profile_image'] as Map<String, dynamic>),
      instagramUsername: json['instagram_username'] as String?,
      totalCollections: json['total_collections'] as int,
      totalLikes: json['total_likes'] as int,
      totalPhotos: json['total_photos'] as int,
      acceptedTos: json['accepted_tos'] as bool,
      forHire: json['for_hire'] as bool,
      social: Social.fromJson(json['social'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'updated_at': instance.updatedAt,
    'username': instance.username,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('twitter_username', instance.twitterUsername);
  writeNotNull('portfolio_url', instance.portfolioUrl);
  writeNotNull('bio', instance.bio);
  writeNotNull('location', instance.location);
  val['links'] = instance.links;
  val['profile_image'] = instance.profileImage;
  writeNotNull('instagram_username', instance.instagramUsername);
  val['total_collections'] = instance.totalCollections;
  val['total_likes'] = instance.totalLikes;
  val['total_photos'] = instance.totalPhotos;
  val['accepted_tos'] = instance.acceptedTos;
  val['for_hire'] = instance.forHire;
  val['social'] = instance.social;
  return val;
}
