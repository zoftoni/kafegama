// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_donasi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceDonasi _$InvoiceDonasiFromJson(Map<String, dynamic> json) =>
    InvoiceDonasi(
      idDonasiTrx: json['id_donasi_trx'] as int?,
      invoiceId: json['invoice_id'] as String?,
      url: json['url'] as String?,
    )..error = json['error'] as String?;

Map<String, dynamic> _$InvoiceDonasiToJson(InvoiceDonasi instance) =>
    <String, dynamic>{
      'id_donasi_trx': instance.idDonasiTrx,
      'invoice_id': instance.invoiceId,
      'url': instance.url,
      'error': instance.error,
    };
