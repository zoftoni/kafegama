// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Alumni _$AlumniFromJson(Map<String, dynamic> json) => Alumni(
      idAlumni: json['id_alumni'] as int?,
      nama: json['nama'] as String?,
      idUser: json['id_user'],
      department: json['department'] as String?,
      degree: json['degree'] as String?,
      graduationDate: json['graduation_date'] as String?,
      statusPekerjaan: json['status_pekerjaan'] as String?,
      namaPerusahaan: json['nama_perusahaan'] as String?,
      posisi: json['posisi'] as String?,
      bidangUsahaPerusahaan: json['bidang_usaha_perusahaan'],
      kotaTempatKerja: json['kota_tempat_kerja'] as String?,
      alamat: json['alamat'] as String?,
      email: json['email'] as String?,
      noHp: json['no_hp'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      photo: json['photo'] as String?,
      sex: json['sex'] as String?,
      tempatLahir: json['tempat_lahir'] as String?,
      tglLahir: json['tgl_lahir'] as String?,
    );

Map<String, dynamic> _$AlumniToJson(Alumni instance) => <String, dynamic>{
      'id_alumni': instance.idAlumni,
      'nama': instance.nama,
      'id_user': instance.idUser,
      'department': instance.department,
      'degree': instance.degree,
      'graduation_date': instance.graduationDate,
      'status_pekerjaan': instance.statusPekerjaan,
      'nama_perusahaan': instance.namaPerusahaan,
      'posisi': instance.posisi,
      'bidang_usaha_perusahaan': instance.bidangUsahaPerusahaan,
      'kota_tempat_kerja': instance.kotaTempatKerja,
      'alamat': instance.alamat,
      'email': instance.email,
      'no_hp': instance.noHp,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'photo': instance.photo,
      'sex': instance.sex,
      'tempat_lahir': instance.tempatLahir,
      'tgl_lahir': instance.tglLahir,
    };
