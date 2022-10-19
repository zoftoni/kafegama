import 'package:json_annotation/json_annotation.dart';

part 'iuran_trx.g.dart';

@JsonSerializable()
class IuranTrx {
  @JsonKey(name: 'id_iuran_trx')
  int? idIuranTrx;
  @JsonKey(name: 'id_user')
  int? idUser;
  @JsonKey(name: 'id_jenis_anggota')
  int? idJenisAnggota;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'trx_date')
  dynamic trxDate;
  dynamic amount;
  @JsonKey(name: 'validity_period')
  dynamic period;
  String? jenis;

  IuranTrx({
    this.idIuranTrx,
    this.idUser,
    this.idJenisAnggota,
    this.trxDate,
    this.amount,
    this.period,
    this.jenis,
    this.createdAt,
    this.updatedAt,
  });

  factory IuranTrx.fromJson(Map<String, dynamic> json) =>
      _$IuranTrxFromJson(json);

  Map<String, dynamic> toJson() => _$IuranTrxToJson(this);
}
