import 'package:json_annotation/json_annotation.dart';

part 'matchine_model_response.g.dart';

@JsonSerializable()
class MatchingModelResponse {
  final bool success;
  final List<MatchData> data;

  MatchingModelResponse({required this.success, required this.data});

  factory MatchingModelResponse.fromJson(Map<String, dynamic> json) =>
      _$MatchingModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MatchingModelResponseToJson(this);
}

@JsonSerializable()
class MatchData {
  final LostItem lost;
  final FoundItem found;

  MatchData({required this.lost, required this.found});

  factory MatchData.fromJson(Map<String, dynamic> json) =>
      _$MatchDataFromJson(json);

  Map<String, dynamic> toJson() => _$MatchDataToJson(this);
}

@JsonSerializable()
class LostItem {
  final int id;
  @JsonKey(name: 'item_type')
  final String itemType;
  final String color;
  @JsonKey(name: 'report_date')
  final DateTime reportDate;
  @JsonKey(name: 'report_time')
  final String reportTime;
  final String location;
  final String description;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String status;
  final String photo;

  LostItem({
    required this.id,
    required this.itemType,
    required this.color,
    required this.reportDate,
    required this.reportTime,
    required this.location,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.status,
    required this.photo,
  });

  factory LostItem.fromJson(Map<String, dynamic> json) =>
      _$LostItemFromJson(json);

  Map<String, dynamic> toJson() => _$LostItemToJson(this);
}

@JsonSerializable()
class FoundItem {
  final int id;
  @JsonKey(name: 'item_type')
  final String itemType;
  final String color;
  @JsonKey(name: 'report_date')
  final DateTime reportDate;
  @JsonKey(name: 'report_time')
  final String reportTime;
  final String location;
  final String description;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String status;
  final String photo;

  FoundItem({
    required this.id,
    required this.itemType,
    required this.color,
    required this.reportDate,
    required this.reportTime,
    required this.location,
    required this.description,
    required this.userId,
    required this.createdAt,
    required this.status,
    required this.photo,
  });

  factory FoundItem.fromJson(Map<String, dynamic> json) =>
      _$FoundItemFromJson(json);

  Map<String, dynamic> toJson() => _$FoundItemToJson(this);
}
