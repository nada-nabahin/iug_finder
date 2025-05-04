import 'package:json_annotation/json_annotation.dart';

part 'all_lost_body_response.g.dart';

@JsonSerializable()
class AllLostBodyResponseModel {
  List<Report>? reports;

  AllLostBodyResponseModel({this.reports});

  factory AllLostBodyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AllLostBodyResponseModelFromJson(json);
}

@JsonSerializable()
class Report {
  @JsonKey(name: 'id')
  int? reportID;
  @JsonKey(name: 'item_type')
  String? itemType;
  String? color;
  @JsonKey(name: 'report_date')
  String? reportDate;
  @JsonKey(name: 'report_time')
  String? reportTime;
  String? location;
  String? description;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? status;
  String? photo;
  @JsonKey(name: 'full_name')
  String? fullName;

  Report({
    this.reportID,
    this.itemType,
    this.color,
    this.reportDate,
    this.reportTime,
    this.location,
    this.description,
    this.userId,
    this.createdAt,
    this.status,
    this.photo,
    this.fullName,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
