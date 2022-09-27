// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Berita _$BeritaFromJson(Map<String, dynamic> json) => Berita(
      idBerita: json['id_berita'] as int?,
      title: json['title'] as String?,
      excerpt: json['excerpt'],
      picture: json['picture'] as String?,
      text: json['text'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$BeritaToJson(Berita instance) => <String, dynamic>{
      'id_berita': instance.idBerita,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'picture': instance.picture,
      'text': instance.text,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
