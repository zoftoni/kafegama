// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlumniList _$AlumniListFromJson(Map<String, dynamic> json) => AlumniList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Alumni.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$AlumniListToJson(AlumniList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
      'error': instance.error,
    };
