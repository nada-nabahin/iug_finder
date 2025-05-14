import 'package:json_annotation/json_annotation.dart';

part 'delete_report_response.g.dart';

@JsonSerializable()
class DeleteReportResponse {
  final String message;

  DeleteReportResponse({required this.message});

  factory DeleteReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteReportResponseToJson(this);
}
