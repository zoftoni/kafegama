import 'package:json_annotation/json_annotation.dart';

part 'faq.g.dart';

@JsonSerializable()
class Faq {
  @JsonKey(name: 'id_page')
  int? idPage;
  String? name;
  String? content;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Faq({
    this.idPage,
    this.name,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => _$FaqFromJson(json);

  Map<String, dynamic> toJson() => _$FaqToJson(this);
}
