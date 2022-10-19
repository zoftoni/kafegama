import 'package:json_annotation/json_annotation.dart';

part 'jenis_anggota.g.dart';

@JsonSerializable()
class JenisAnggota {
  @JsonKey(name: 'id_jenis_anggota')
  int? idJenisAnggota;
  String? title;
  String? img;
  String? desc;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic price;
  @JsonKey(name: 'validity_period')
  dynamic validityPeriod;

  JenisAnggota({
    this.idJenisAnggota,
    this.title,
    this.img,
    this.desc,
    this.createdAt,
    this.updatedAt,
    this.price,
    this.validityPeriod,
  });

  factory JenisAnggota.fromJson(Map<String, dynamic> json) =>
      _$JenisAnggotaFromJson(json);

  Map<String, dynamic> toJson() => _$JenisAnggotaToJson(this);
}
