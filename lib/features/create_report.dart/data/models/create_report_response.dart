import 'package:json_annotation/json_annotation.dart';

part 'create_report_response.g.dart';

@JsonSerializable()
class CreateReportModelResponse {
  final String message;
  final int reportId;

  CreateReportModelResponse({
    required this.message,
    required this.reportId,
  });

  factory CreateReportModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReportModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateReportModelResponseToJson(this);
}
