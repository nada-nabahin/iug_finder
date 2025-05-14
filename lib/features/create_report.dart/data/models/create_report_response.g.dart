// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReportModelResponse _$CreateReportModelResponseFromJson(
        Map<String, dynamic> json) =>
    CreateReportModelResponse(
      message: json['message'] as String,
      reportId: (json['reportId'] as num).toInt(),
    );

Map<String, dynamic> _$CreateReportModelResponseToJson(
        CreateReportModelResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'reportId': instance.reportId,
    };
