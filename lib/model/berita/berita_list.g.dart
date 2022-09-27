// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'berita_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeritaList _$BeritaListFromJson(Map<String, dynamic> json) => BeritaList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Berita.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$BeritaListToJson(BeritaList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
      'error': instance.error,
    };
