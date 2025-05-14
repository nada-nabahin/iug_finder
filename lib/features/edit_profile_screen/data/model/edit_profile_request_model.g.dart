// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditProfileRequestModel _$EditProfileRequestModelFromJson(
        Map<String, dynamic> json) =>
    EditProfileRequestModel(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      universityId: json['university_id'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$EditProfileRequestModelToJson(
        EditProfileRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'university_id': instance.universityId,
      'password': instance.password,
    };
