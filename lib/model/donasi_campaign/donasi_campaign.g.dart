// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donasi_campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonasiCampaign _$DonasiCampaignFromJson(Map<String, dynamic> json) =>
    DonasiCampaign(
      idDonasiCampaign: json['id_donasi_campaign'] as int?,
      title: json['title'] as String?,
      excerpt: json['excerpt'] as String?,
      picture: json['picture'] as String?,
      text: json['text'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      startDate: json['start_date'],
      endDate: json['end_date'],
      total: json['total'],
      target: json['target'] as String?,
    );

Map<String, dynamic> _$DonasiCampaignToJson(DonasiCampaign instance) =>
    <String, dynamic>{
      'id_donasi_campaign': instance.idDonasiCampaign,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'picture': instance.picture,
      'text': instance.text,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'total': instance.total,
      'target': instance.target,
    };
