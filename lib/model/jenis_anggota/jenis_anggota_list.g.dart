// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenis_anggota_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JenisAnggotaList _$JenisAnggotaListFromJson(Map<String, dynamic> json) =>
    JenisAnggotaList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => JenisAnggota.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..error = json['error'] as String?
      ..responseCode = json['responseCode'] as int?;

Map<String, dynamic> _$JenisAnggotaListToJson(JenisAnggotaList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
      'responseCode': instance.responseCode,
    };
