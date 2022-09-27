import 'package:json_annotation/json_annotation.dart';

part 'berita.g.dart';

@JsonSerializable()
class Berita {
  @JsonKey(name: 'id_berita')
  int? idBerita;
  String? title;
  dynamic excerpt;
  String? picture;
  String? text;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Berita({
    this.idBerita,
    this.title,
    this.excerpt,
    this.picture,
    this.text,
    this.createdAt,
    this.updatedAt,
  });

  factory Berita.fromJson(Map<String, dynamic> json) => _$BeritaFromJson(json);

  Map<String, dynamic> toJson() => _$BeritaToJson(this);
}
