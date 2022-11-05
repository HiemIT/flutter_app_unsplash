import 'package:json_annotation/json_annotation.dart';

 part 'urls.g.dart';

@JsonSerializable()
class Urls {
  @JsonKey(name: 'raw', includeIfNull: false)
  final String raw;

  @JsonKey(name: 'full', includeIfNull: false)
  final String full;

  @JsonKey(name: 'regular', includeIfNull: false)
  final String regular;

  @JsonKey(name: 'small', includeIfNull: false)
  final String small;

  @JsonKey(name: 'thumb', includeIfNull: false)
  final String thumb;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
  });


  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);

  Map<String, dynamic> toJson() => _$UrlsToJson(this);
}
