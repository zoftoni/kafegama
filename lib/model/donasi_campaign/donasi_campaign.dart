import 'package:json_annotation/json_annotation.dart';

part 'donasi_campaign.g.dart';

@JsonSerializable()
class DonasiCampaign {
  @JsonKey(name: 'id_donasi_campaign')
  int? idDonasiCampaign;
  String? title;
  String? excerpt;
  String? picture;
  String? text;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'start_date')
  dynamic startDate;
  @JsonKey(name: 'end_date')
  dynamic endDate;
  dynamic total;
  String? target;

  DonasiCampaign({
    this.idDonasiCampaign,
    this.title,
    this.excerpt,
    this.picture,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.startDate,
    this.endDate,
    this.total,
    this.target,
  });

  factory DonasiCampaign.fromJson(Map<String, dynamic> json) =>
      _$DonasiCampaignFromJson(json);

  Map<String, dynamic> toJson() => _$DonasiCampaignToJson(this);
}
