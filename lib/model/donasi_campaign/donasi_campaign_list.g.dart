// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donasi_campaign_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonasiCampaignList _$DonasiCampaignListFromJson(Map<String, dynamic> json) =>
    DonasiCampaignList(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DonasiCampaign.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: json['links'] == null
          ? null
          : Links.fromJson(json['links'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    )..error = json['error'] as String?;

Map<String, dynamic> _$DonasiCampaignListToJson(DonasiCampaignList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'links': instance.links,
      'meta': instance.meta,
      'error': instance.error,
    };
