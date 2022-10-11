import 'package:json_annotation/json_annotation.dart';

part 'alumni.g.dart';

@JsonSerializable()
class Alumni {
  @JsonKey(name: 'id_alumni')
  int? idAlumni;
  String? nama;
  @JsonKey(name: 'id_user')
  dynamic idUser;
  String? department;
  String? degree;
  @JsonKey(name: 'status_pekerjaan')
  String? statusPekerjaan;
  @JsonKey(name: 'nama_perusahaan')
  String? namaPerusahaan;
  String? posisi;
  @JsonKey(name: 'bidang_usaha_perusahaan')
  dynamic bidangUsahaPerusahaan;
  @JsonKey(name: 'kota_tempat_kerja')
  String? kotaTempatKerja;
  String? alamat;
  String? email;
  @JsonKey(name: 'no_hp')
  String? noHp;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  String? photo;
  String? sex;
  @JsonKey(name: 'tempat_lahir')
  String? tempatLahir;
  @JsonKey(name: 'tgl_lahir')
  String? tglLahir;
  @JsonKey(name: 'angkatan_tahun')
  int? angkatanTahun;
  @JsonKey(name: 'lulusan_tahun')
  int? lulusanTahun;
  @JsonKey(name: 'nis')
  String? nis;

  Alumni(
      {this.idAlumni,
      this.nama,
      this.idUser,
      this.department,
      this.degree,
      this.statusPekerjaan,
      this.namaPerusahaan,
      this.posisi,
      this.bidangUsahaPerusahaan,
      this.kotaTempatKerja,
      this.alamat,
      this.email,
      this.noHp,
      this.createdAt,
      this.updatedAt,
      this.photo,
      this.sex,
      this.tempatLahir,
      this.tglLahir,
      this.angkatanTahun,
      this.lulusanTahun,
      this.nis});

  factory Alumni.fromJson(Map<String, dynamic> json) {
    return _$AlumniFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AlumniToJson(this);
}
