import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/common/links.dart';
import 'package:kafegama/model/common/meta.dart';
import 'package:kafegama/model/donasi_trx/donasi_trx.dart';

part 'donasi_trx_list.g.dart';

@JsonSerializable()
class DonasiTrxList {
  List<DonasiTrx>? data;
  Links? links;
  Meta? meta;
  String? error;

  DonasiTrxList({this.data, this.links, this.meta});

  factory DonasiTrxList.fromJson(Map<String, dynamic> json) {
    return _$DonasiTrxListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DonasiTrxListToJson(this);
  DonasiTrxList.withError(String errorValue)
      : data = null,
        error = errorValue;
}
