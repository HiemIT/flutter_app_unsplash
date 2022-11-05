import 'package:json_annotation/json_annotation.dart';

part 'profile_image.g.dart';

@JsonSerializable()
class ProfileImage {
  @JsonKey(name: 'small', includeIfNull: false)
  final String small;
  @JsonKey(name: 'medium', includeIfNull: false)
  final String medium;
  @JsonKey(name: 'large', includeIfNull: false)
  final String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) =>
      _$ProfileImageFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileImageToJson(this);
}
