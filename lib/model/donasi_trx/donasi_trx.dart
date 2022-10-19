import 'package:json_annotation/json_annotation.dart';

part 'donasi_trx.g.dart';

@JsonSerializable()
class DonasiTrx {
  @JsonKey(name: 'id_donasi_trx')
  int? idDonasiTrx;
  @JsonKey(name: 'id_user')
  int? idUser;
  @JsonKey(name: 'id_donasi_campaign')
  int? idDonasiCampaign;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'trx_date')
  dynamic trxDate;
  dynamic amount;
  String? campaign;

  DonasiTrx({
    this.idDonasiTrx,
    this.idUser,
    this.idDonasiCampaign,
    this.trxDate,
    this.amount,
    this.campaign,
    this.createdAt,
    this.updatedAt,
  });

  factory DonasiTrx.fromJson(Map<String, dynamic> json) =>
      _$DonasiTrxFromJson(json);

  Map<String, dynamic> toJson() => _$DonasiTrxToJson(this);
}
