// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bursa_kerja_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BursaKerjaList _$BursaKerjaListFromJson(Map<String, dynamic> json) =>
    BursaKerjaList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BursaKerja.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$BursaKerjaListToJson(BursaKerjaList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
      'error': instance.error,
    };
