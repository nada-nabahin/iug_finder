import 'package:json_annotation/json_annotation.dart';

part 'edit_report_response.g.dart';

@JsonSerializable()
class EditReportModelResponse {
  final String message;
  @JsonKey(name: 'Id_Report')
  final String reportId;

  EditReportModelResponse({
    required this.message,
    required this.reportId,
  });

  factory EditReportModelResponse.fromJson(Map<String, dynamic> json) =>
      _$EditReportModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EditReportModelResponseToJson(this);
}
