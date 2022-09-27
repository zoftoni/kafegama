import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/common/links.dart';
import 'package:kafegama/model/common/meta.dart';
import 'package:kafegama/model/donasi_campaign/donasi_campaign.dart';

part 'donasi_campaign_list.g.dart';

@JsonSerializable()
class DonasiCampaignList {
  List<DonasiCampaign>? data;
  Links? links;
  Meta? meta;
  String? error;

  DonasiCampaignList({this.data, this.links, this.meta});

  factory DonasiCampaignList.fromJson(Map<String, dynamic> json) {
    return _$DonasiCampaignListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DonasiCampaignListToJson(this);
  DonasiCampaignList.withError(String errorValue)
      : data = null,
        error = errorValue;
}
