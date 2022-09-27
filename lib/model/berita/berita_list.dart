import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/common/links.dart';
import 'package:kafegama/model/common/meta.dart';

import 'berita.dart';

part 'berita_list.g.dart';

@JsonSerializable()
class BeritaList {
  List<Berita>? data;
  Links? links;
  Meta? meta;
  String? error;

  BeritaList({this.data, this.links, this.meta, this.error});

  factory BeritaList.fromJson(Map<String, dynamic> json) {
    return _$BeritaListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BeritaListToJson(this);
  BeritaList.withError(String errorValue)
      : data = null,
        error = errorValue;
}
