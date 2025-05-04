import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

// حسب شو بيرجعلي من جيسون
/* {
"message": "error",
"code": 1
}
*/
@JsonSerializable()
class ApiErrorModel {
  final String? message;

  ApiErrorModel({
    required this.message,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
