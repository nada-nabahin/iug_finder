// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateReportModelRequest _$CreateReportModelRequestFromJson(
        Map<String, dynamic> json) =>
    CreateReportModelRequest(
      id: (json['id'] as num?)?.toInt(),
      lostType: json['status'] as String,
      itemType: json['item_type'] as String,
      color: json['color'] as String,
      reportDate: json['report_date'] as String,
      reportTime: json['report_time'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreateReportModelRequestToJson(
        CreateReportModelRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.lostType,
      'item_type': instance.itemType,
      'color': instance.color,
      'report_date': instance.reportDate,
      'report_time': instance.reportTime,
      'location': instance.location,
      'description': instance.description,
    };
