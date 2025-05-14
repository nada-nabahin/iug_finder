// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseModel _$ProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    ProfileResponseModel(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseModelToJson(
        ProfileResponseModel instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      fullName: json['full_name'] as String,
      email: json['email'] as String,
      universityId: json['university_id'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      createdAt: json['created_at'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'email': instance.email,
      'university_id': instance.universityId,
      'phone': instance.phone,
      'role': instance.role,
      'created_at': instance.createdAt,
      'photo': instance.photo,
    };
