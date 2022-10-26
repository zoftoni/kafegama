import 'package:json_annotation/json_annotation.dart';

part 'invoice_donasi.g.dart';

@JsonSerializable()
class InvoiceDonasi {
  @JsonKey(name: 'id_donasi_trx')
  int? idDonasiTrx;
  @JsonKey(name: 'invoice_id')
  String? invoiceId;
  String? url;
  String? error;

  InvoiceDonasi({this.idDonasiTrx, this.invoiceId, this.url});

  factory InvoiceDonasi.fromJson(Map<String, dynamic> json) {
    return _$InvoiceDonasiFromJson(json);
  }

  Map<String, dynamic> toJson() => _$InvoiceDonasiToJson(this);
  InvoiceDonasi.withError(String errorValue) : error = errorValue;
}
