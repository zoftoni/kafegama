import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/faq/faq.dart';

part 'faq_response.g.dart';

@JsonSerializable()
class FaqResponse {
  Faq? data;
  String? error;
  int? responseCode;

  FaqResponse({this.data});

  factory FaqResponse.fromJson(Map<String, dynamic> json) {
    return _$FaqResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FaqResponseToJson(this);
  FaqResponse.withError(String errorValue, int this.responseCode)
      : data = null,
        error = errorValue;
}
