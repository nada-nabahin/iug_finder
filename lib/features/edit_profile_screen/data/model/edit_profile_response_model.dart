import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_response_model.g.dart';

@JsonSerializable()
class EditProfileResponseModel {
  final String? status;
  final String? message;

  EditProfileResponseModel({this.status, this.message});

  // Factory method to create an instance from JSON
  factory EditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EditProfileResponseModelFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$EditProfileResponseModelToJson(this);
}
