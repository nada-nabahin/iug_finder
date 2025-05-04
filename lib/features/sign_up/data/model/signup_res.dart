import 'package:json_annotation/json_annotation.dart';
part 'signup_res.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;

  SignupResponse({this.message});

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
