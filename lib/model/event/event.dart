import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  @JsonKey(name: 'id_event')
  int? idEvent;
  String? title;
  String? excerpt;
  String? picture;
  String? text;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'tgl_event')
  String? tglEvent;

  Event({
    this.idEvent,
    this.title,
    this.excerpt,
    this.picture,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.tglEvent,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}
