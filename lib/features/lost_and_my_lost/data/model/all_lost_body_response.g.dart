// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_lost_body_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLostBodyResponseModel _$AllLostBodyResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllLostBodyResponseModel(
      reports: (json['reports'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllLostBodyResponseModelToJson(
        AllLostBodyResponseModel instance) =>
    <String, dynamic>{
      'reports': instance.reports,
    };

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      reportID: (json['id'] as num?)?.toInt(),
      itemType: json['item_type'] as String?,
      color: json['color'] as String?,
      reportDate: json['report_date'] as String?,
      reportTime: json['report_time'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      status: json['status'] as String?,
      photo: json['photo'] as String?,
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'id': instance.reportID,
      'item_type': instance.itemType,
      'color': instance.color,
      'report_date': instance.reportDate,
      'report_time': instance.reportTime,
      'location': instance.location,
      'description': instance.description,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'status': instance.status,
      'photo': instance.photo,
      'full_name': instance.fullName,
    };
