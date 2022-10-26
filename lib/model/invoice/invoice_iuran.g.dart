// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_iuran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceIuran _$InvoiceIuranFromJson(Map<String, dynamic> json) => InvoiceIuran(
      idIuranTrx: json['id_iuran_trx'] as int?,
      invoiceId: json['invoice_id'] as String?,
      url: json['url'] as String?,
    )..error = json['error'] as String?;

Map<String, dynamic> _$InvoiceIuranToJson(InvoiceIuran instance) =>
    <String, dynamic>{
      'id_iuran_trx': instance.idIuranTrx,
      'invoice_id': instance.invoiceId,
      'url': instance.url,
      'error': instance.error,
    };
