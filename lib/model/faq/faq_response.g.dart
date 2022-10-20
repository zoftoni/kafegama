// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaqResponse _$FaqResponseFromJson(Map<String, dynamic> json) => FaqResponse(
      data: json['data'] == null
          ? null
          : Faq.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..error = json['error'] as String?
      ..responseCode = json['responseCode'] as int?;

Map<String, dynamic> _$FaqResponseToJson(FaqResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'responseCode': instance.responseCode,
    };
