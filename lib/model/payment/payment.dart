import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Payment {
  String? title;
  String? subtitle;
  int? amount;

  Payment({this.title, this.subtitle, this.amount});
}
