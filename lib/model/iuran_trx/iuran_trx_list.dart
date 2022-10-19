import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/common/links.dart';
import 'package:kafegama/model/common/meta.dart';
import 'package:kafegama/model/iuran_trx/iuran_trx.dart';

part 'iuran_trx_list.g.dart';

@JsonSerializable()
class IuranTrxList {
  List<IuranTrx>? data;
  Links? links;
  Meta? meta;
  String? error;

  IuranTrxList({this.data, this.links, this.meta});

  factory IuranTrxList.fromJson(Map<String, dynamic> json) {
    return _$IuranTrxListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IuranTrxListToJson(this);
  IuranTrxList.withError(String errorValue)
      : data = null,
        error = errorValue;
}
