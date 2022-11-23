import 'package:json_annotation/json_annotation.dart';

part 'invoice_iuran.g.dart';

@JsonSerializable()
class InvoiceIuran {
  @JsonKey(name: 'id_iuran_trx')
  int? idIuranTrx;
  @JsonKey(name: 'invoice_id')
  String? invoiceId;
  String? url;
  @JsonKey(name: 'app_key')
  String? appKey;
  String? cluster;
  String? error;

  InvoiceIuran({this.idIuranTrx, this.invoiceId, this.url});

  factory InvoiceIuran.fromJson(Map<String, dynamic> json) {
    return _$InvoiceIuranFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvoiceIuranToJson(this);
  InvoiceIuran.withError(String errorValue) : error = errorValue;
}
