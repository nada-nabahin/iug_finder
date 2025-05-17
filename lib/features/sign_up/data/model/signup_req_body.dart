import 'package:json_annotation/json_annotation.dart';
part 'signup_req_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  @JsonKey(name: 'full_name')
  final String userName;
  final String email;
  @JsonKey(name: 'university_id')
  final String universityID;
  final String phone;
  final String password;
  final String confirmPassword;
  final String photo;

  SignupRequestBody({
    required this.userName,
    required this.email,
    required this.phone,
    required this.universityID,
    required this.password,
    required this.confirmPassword,
    required this.photo,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
