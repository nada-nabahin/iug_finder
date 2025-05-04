import 'package:json_annotation/json_annotation.dart';
part 'login_res_body.g.dart';

@JsonSerializable()
class LoginResponse {
  String? message;
  @JsonKey(name: 'user')
  UserData? userData;

  LoginResponse({this.message, this.userData});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  int? id;
  @JsonKey(name: 'name') // username in json name
  String? userName;
  String? role;
  String? email;
  String? token;
  @JsonKey(name: 'university_id') // username in json name
  String? universityId;
  String? phone;

  UserData(
      {this.id,
      this.userName,
      this.role,
      this.email,
      this.token,
      this.universityId,
      this.phone});
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
