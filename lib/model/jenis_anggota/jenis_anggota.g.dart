// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jenis_anggota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JenisAnggota _$JenisAnggotaFromJson(Map<String, dynamic> json) => JenisAnggota(
      idJenisAnggota: json['id_jenis_anggota'] as int?,
      title: json['title'] as String?,
      img: json['img'] as String?,
      desc: json['desc'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      price: json['price'],
      validityPeriod: json['validity_period'],
    );

Map<String, dynamic> _$JenisAnggotaToJson(JenisAnggota instance) =>
    <String, dynamic>{
      'id_jenis_anggota': instance.idJenisAnggota,
      'title': instance.title,
      'img': instance.img,
      'desc': instance.desc,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'price': instance.price,
      'validity_period': instance.validityPeriod,
    };
