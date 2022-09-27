// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      password: json['password'] as String?,
      rememberToken: json['remember_token'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      isAdmin: json['is_admin'] as int?,
      noHp: json['no_hp'],
      idStatusAnggota: json['id_status_anggota'],
      statusAnggotaExpiredDate: json['status_anggota_expired_date'],
      isDataAlumniEntered: json['is_data_alumni_entered'] as int?,
      statusAnggota: json['status_anggota'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'password': instance.password,
      'remember_token': instance.rememberToken,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_admin': instance.isAdmin,
      'no_hp': instance.noHp,
      'id_status_anggota': instance.idStatusAnggota,
      'status_anggota_expired_date': instance.statusAnggotaExpiredDate,
      'is_data_alumni_entered': instance.isDataAlumniEntered,
      'status_anggota': instance.statusAnggota,
    };
