// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditReportModelResponse _$EditReportModelResponseFromJson(
        Map<String, dynamic> json) =>
    EditReportModelResponse(
      message: json['message'] as String,
      reportId: json['Id_Report'] as String,
    );

Map<String, dynamic> _$EditReportModelResponseToJson(
        EditReportModelResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'Id_Report': instance.reportId,
    };
