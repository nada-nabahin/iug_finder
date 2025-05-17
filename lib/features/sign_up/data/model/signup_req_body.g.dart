// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      userName: json['full_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      universityID: json['university_id'] as String,
      password: json['password'] as String,
      confirmPassword: json['confirmPassword'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'full_name': instance.userName,
      'email': instance.email,
      'university_id': instance.universityID,
      'phone': instance.phone,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'photo': instance.photo,
    };
