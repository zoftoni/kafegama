// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bursa_kerja.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BursaKerja _$BursaKerjaFromJson(Map<String, dynamic> json) => BursaKerja(
      idBursaKerja: json['id_bursa_kerja'] as int?,
      title: json['title'] as String?,
      excerpt: json['excerpt'] as String?,
      picture: json['picture'] as String?,
      text: json['text'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$BursaKerjaToJson(BursaKerja instance) =>
    <String, dynamic>{
      'id_bursa_kerja': instance.idBursaKerja,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'picture': instance.picture,
      'text': instance.text,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
