import 'package:json_annotation/json_annotation.dart';
import 'package:kafegama/core.dart';

part 'jenis_anggota_list.g.dart';

@JsonSerializable()
class JenisAnggotaList {
  List<JenisAnggota>? data;
  String? error;
  int? responseCode;

  JenisAnggotaList({this.data});

  factory JenisAnggotaList.fromJson(Map<String, dynamic> json) {
    return _$JenisAnggotaListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JenisAnggotaListToJson(this);
  JenisAnggotaList.withError(String errorValue, int this.responseCode)
      : data = null,
        error = errorValue;
}
