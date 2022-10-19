// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donasi_trx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonasiTrx _$DonasiTrxFromJson(Map<String, dynamic> json) => DonasiTrx(
      idDonasiTrx: json['id_donasi_trx'] as int?,
      idUser: json['id_user'] as int?,
      idDonasiCampaign: json['id_donasi_campaign'] as int?,
      trxDate: json['trx_date'],
      amount: json['amount'],
      campaign: json['campaign'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DonasiTrxToJson(DonasiTrx instance) => <String, dynamic>{
      'id_donasi_trx': instance.idDonasiTrx,
      'id_user': instance.idUser,
      'id_donasi_campaign': instance.idDonasiCampaign,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'trx_date': instance.trxDate,
      'amount': instance.amount,
      'campaign': instance.campaign,
    };
