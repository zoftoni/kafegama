// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      idEvent: json['id_event'] as int?,
      title: json['title'] as String?,
      excerpt: json['excerpt'] as String?,
      picture: json['picture'] as String?,
      text: json['text'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      tglEvent: json['tgl_event'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id_event': instance.idEvent,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'picture': instance.picture,
      'text': instance.text,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'tgl_event': instance.tglEvent,
    };
