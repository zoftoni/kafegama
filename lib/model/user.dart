import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;
  String? password;
  @JsonKey(name: 'remember_token')
  dynamic rememberToken;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'is_admin')
  int? isAdmin;
  @JsonKey(name: 'no_hp')
  dynamic noHp;
  @JsonKey(name: 'id_status_anggota')
  dynamic idStatusAnggota;
  @JsonKey(name: 'status_anggota_expired_date')
  dynamic statusAnggotaExpiredDate;
  @JsonKey(name: 'is_data_alumni_entered')
  int? isDataAlumniEntered;
  @JsonKey(name: 'status_anggota')
  String? statusAnggota;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.password,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.isAdmin,
    this.noHp,
    this.idStatusAnggota,
    this.statusAnggotaExpiredDate,
    this.isDataAlumniEntered,
    this.statusAnggota,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
