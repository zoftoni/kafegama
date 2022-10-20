// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faq _$FaqFromJson(Map<String, dynamic> json) => Faq(
      idPage: json['id_page'] as int?,
      name: json['name'] as String?,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$FaqToJson(Faq instance) => <String, dynamic>{
      'id_page': instance.idPage,
      'name': instance.name,
      'content': instance.content,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
