// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      message: json['message'] as String?,
      userData: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: (json['id'] as num?)?.toInt(),
      userName: json['name'] as String?,
      role: json['role'] as String?,
      email: json['email'] as String?,
      token: json['token'] as String?,
      universityId: json['university_id'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.userName,
      'role': instance.role,
      'email': instance.email,
      'token': instance.token,
      'university_id': instance.universityId,
      'phone': instance.phone,
    };
