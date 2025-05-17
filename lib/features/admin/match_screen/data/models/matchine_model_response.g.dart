// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matchine_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchingModelResponse _$MatchingModelResponseFromJson(
        Map<String, dynamic> json) =>
    MatchingModelResponse(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => MatchData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchingModelResponseToJson(
        MatchingModelResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

MatchData _$MatchDataFromJson(Map<String, dynamic> json) => MatchData(
      lost: LostItem.fromJson(json['lost'] as Map<String, dynamic>),
      found: FoundItem.fromJson(json['found'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchDataToJson(MatchData instance) => <String, dynamic>{
      'lost': instance.lost,
      'found': instance.found,
    };

LostItem _$LostItemFromJson(Map<String, dynamic> json) => LostItem(
      id: (json['id'] as num).toInt(),
      itemType: json['item_type'] as String,
      color: json['color'] as String,
      reportDate: DateTime.parse(json['report_date'] as String),
      reportTime: json['report_time'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      userId: (json['user_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      status: json['status'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$LostItemToJson(LostItem instance) => <String, dynamic>{
      'id': instance.id,
      'item_type': instance.itemType,
      'color': instance.color,
      'report_date': instance.reportDate.toIso8601String(),
      'report_time': instance.reportTime,
      'location': instance.location,
      'description': instance.description,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'photo': instance.photo,
    };

FoundItem _$FoundItemFromJson(Map<String, dynamic> json) => FoundItem(
      id: (json['id'] as num).toInt(),
      itemType: json['item_type'] as String,
      color: json['color'] as String,
      reportDate: DateTime.parse(json['report_date'] as String),
      reportTime: json['report_time'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      userId: (json['user_id'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      status: json['status'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$FoundItemToJson(FoundItem instance) => <String, dynamic>{
      'id': instance.id,
      'item_type': instance.itemType,
      'color': instance.color,
      'report_date': instance.reportDate.toIso8601String(),
      'report_time': instance.reportTime,
      'location': instance.location,
      'description': instance.description,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'photo': instance.photo,
    };
