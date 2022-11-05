import 'package:json_annotation/json_annotation.dart';

part 'social.g.dart';

@JsonSerializable()
class Social {
  @JsonKey(name: 'instagram_username', includeIfNull: false)
  final String? instagramUsername;
  @JsonKey(name: 'portfolio_url', includeIfNull: false)
  final String? portfolioUrl;
  @JsonKey(name: 'twitter_username', includeIfNull: false)
  final String? twitter_username;
  @JsonKey(name: 'paypal_email', includeIfNull: false)
  final String? paypal_email;

  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitter_username,
    this.paypal_email,
  });

  factory Social.fromJson(Map<String, dynamic> json) => _$SocialFromJson(json);

  Map<String, dynamic> toJson() => _$SocialToJson(this);
}
