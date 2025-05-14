import 'package:json_annotation/json_annotation.dart';

part 'profile_request_model.g.dart';

@JsonSerializable()
class ProfileRequestModel {
  final int id;

  ProfileRequestModel({required this.id});

  factory ProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileRequestModelToJson(this);
}
