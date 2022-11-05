// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Social _$SocialFromJson(Map<String, dynamic> json) => Social(
      instagramUsername: json['instagram_username'] as String?,
      portfolioUrl: json['portfolio_url'] as String?,
      twitter_username: json['twitter_username'] as String?,
      paypal_email: json['paypal_email'] as String?,
    );

Map<String, dynamic> _$SocialToJson(Social instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('instagram_username', instance.instagramUsername);
  writeNotNull('portfolio_url', instance.portfolioUrl);
  writeNotNull('twitter_username', instance.twitter_username);
  writeNotNull('paypal_email', instance.paypal_email);
  return val;
}
