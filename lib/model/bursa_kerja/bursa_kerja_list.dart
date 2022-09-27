import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/common/links.dart';
import 'package:kafegama/model/common/meta.dart';

import 'bursa_kerja.dart';

part 'bursa_kerja_list.g.dart';

@JsonSerializable()
class BursaKerjaList {
  List<BursaKerja>? data;
  Links? links;
  Meta? meta;
  String? error;

  BursaKerjaList({this.data, this.links, this.meta, this.error});

  factory BursaKerjaList.fromJson(Map<String, dynamic> json) {
    return _$BursaKerjaListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BursaKerjaListToJson(this);
  BursaKerjaList.withError(String errorValue)
      : data = null,
        error = errorValue;
}
