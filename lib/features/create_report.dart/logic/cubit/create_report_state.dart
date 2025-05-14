import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
part 'create_report_state.freezed.dart';

@freezed
class CreateReportState<T> with _$CreateReportState<T> {
  const factory CreateReportState.initial() = _Initial;
  const factory CreateReportState.loading() = Loading;
  const factory CreateReportState.success(T data) = Success<T>;
  const factory CreateReportState.imagePicked(T image) = ImagePicked;
  const factory CreateReportState.error({required String error}) = Error;
}
