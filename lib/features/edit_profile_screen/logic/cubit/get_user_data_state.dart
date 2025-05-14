import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/profile_response_model.dart';

part 'get_user_data_state.freezed.dart';

@freezed
class GetUserDataState<T> with _$GetUserDataState<T> {
  const factory GetUserDataState.initial() = _Initial;
  const factory GetUserDataState.loading() = Loading;
  const factory GetUserDataState.success(T data) = Success<T>;
  const factory GetUserDataState.imagePicked(T image) = ImagePicked<T>;

  const factory GetUserDataState.error({required String error}) = Error;
}
