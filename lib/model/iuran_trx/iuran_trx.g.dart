// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iuran_trx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IuranTrx _$IuranTrxFromJson(Map<String, dynamic> json) => IuranTrx(
      idIuranTrx: json['id_iuran_trx'] as int?,
      idUser: json['id_user'] as int?,
      idJenisAnggota: json['id_jenis_anggota'] as int?,
      trxDate: json['trx_date'],
      amount: json['amount'],
      period: json['validity_period'],
      jenis: json['jenis'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$IuranTrxToJson(IuranTrx instance) => <String, dynamic>{
      'id_iuran_trx': instance.idIuranTrx,
      'id_user': instance.idUser,
      'id_jenis_anggota': instance.idJenisAnggota,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'trx_date': instance.trxDate,
      'amount': instance.amount,
      'validity_period': instance.period,
      'jenis': instance.jenis,
    };
