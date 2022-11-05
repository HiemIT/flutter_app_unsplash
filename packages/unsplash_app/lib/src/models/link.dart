import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Links {
  @JsonKey(name: 'self', includeIfNull: false)
  final String self;
  @JsonKey(name: 'html', includeIfNull: false)
  final String html;
  @JsonKey(name: 'download', includeIfNull: false)
  final String? download;
  @JsonKey(name: 'download_location', includeIfNull: false)
  final String? downloadLocation;

  @JsonKey(name: 'related', includeIfNull: false)
  final String? related;
  @JsonKey(name: 'photos', includeIfNull: false)
  final String? photos;
  @JsonKey(name: 'likes', includeIfNull: false)
  final String? likes;
  @JsonKey(name: 'portfolio', includeIfNull: false)
  final String? portfolio;

  @JsonKey(name: 'following', includeIfNull: false)
  final String? following;
  @JsonKey(name: 'followers', includeIfNull: false)
  final String? followers;

  Links({
    required this.self,
    required this.html,
    this.download,
    this.downloadLocation,
    this.related,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
