import 'package:json_annotation/json_annotation.dart';

part 'create_report_request.g.dart';

@JsonSerializable()
class CreateReportModelRequest {
  final int? id;
  @JsonKey(name: 'status')
  final String lostType;

  @JsonKey(name: 'item_type')
  final String itemType;

  final String color;

  @JsonKey(name: 'report_date')
  final String reportDate;

  @JsonKey(name: 'report_time')
  final String reportTime;

  final String location;
  final String description;
  // final String? photo;

  CreateReportModelRequest({
    this.id,
    required this.lostType,
    required this.itemType,
    required this.color,
    required this.reportDate,
    required this.reportTime,
    required this.location,
    required this.description,
    // this.photo,
  });

  factory CreateReportModelRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateReportModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReportModelRequestToJson(this);
}
