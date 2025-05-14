import 'package:json_annotation/json_annotation.dart';

part 'profile_response_model.g.dart';

@JsonSerializable()
class ProfileResponseModel {
  final User user;

  ProfileResponseModel({required this.user});

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseModelToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String email;
  @JsonKey(name: 'university_id')
  final String universityId;
  final String phone;
  final String role;
  @JsonKey(name: 'created_at')
  final String createdAt;
  final String photo;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    required this.universityId,
    required this.phone,
    required this.role,
    required this.createdAt,
    required this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
