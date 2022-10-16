// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      data: json['data'] == null
          ? null
          : Alumni.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..error = json['error'] as String?
      ..responseCode = json['responseCode'] as int?;

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'responseCode': instance.responseCode,
    };
