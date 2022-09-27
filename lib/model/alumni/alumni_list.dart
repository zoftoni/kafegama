import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/model/common/links.dart';
import 'package:kafegama/model/common/meta.dart';

import 'alumni.dart';

part 'alumni_list.g.dart';

@JsonSerializable()
class AlumniList {
  List<Alumni>? data;
  Links? links;
  Meta? meta;
  String? error;

  AlumniList({this.data, this.links, this.meta, this.error});

  factory AlumniList.fromJson(Map<String, dynamic> json) {
    return _$AlumniListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AlumniListToJson(this);
  AlumniList.withError(String errorValue)
      : data = null,
        error = errorValue;
}
