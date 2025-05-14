import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_model.g.dart';

@JsonSerializable()
class EditProfileRequestModel {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'full_name')
  final String fullName;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'university_id')
  final String? universityId;

  @JsonKey(name: 'password')
  final String? password;

  EditProfileRequestModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    this.universityId,
    this.password,
  });

  factory EditProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestModelToJson(this);
}
