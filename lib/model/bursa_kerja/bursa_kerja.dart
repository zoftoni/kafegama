import 'package:json_annotation/json_annotation.dart';

part 'bursa_kerja.g.dart';

@JsonSerializable()
class BursaKerja {
  @JsonKey(name: 'id_bursa_kerja')
  int? idBursaKerja;
  String? title;
  String? excerpt;
  String? picture;
  String? text;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  BursaKerja({
    this.idBursaKerja,
    this.title,
    this.excerpt,
    this.picture,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  factory BursaKerja.fromJson(Map<String, dynamic> json) {
    return _$BursaKerjaFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BursaKerjaToJson(this);
}
