import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/core.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  Alumni? data;
  String? error;
  int? responseCode;

  UserProfile({this.data});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return _$UserProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
  UserProfile.withError(String errorValue, int this.responseCode)
      : data = null,
        error = errorValue;
}
