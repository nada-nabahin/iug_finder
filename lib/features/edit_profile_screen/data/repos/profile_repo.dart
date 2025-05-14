import 'dart:io';

import 'package:iug_finder/core/helpers/constants.dart';
import 'package:iug_finder/core/helpers/shared_pref_helper.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/core/networking/api_result.dart';
import 'package:iug_finder/core/networking/api_service.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/edit_profile_request_model.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/edit_profile_response_model.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/profile_response_model.dart';

class ProfileRepo {
  final ApiService _apiService;

  ProfileRepo(this._apiService);

  Future<ApiResult<ProfileResponseModel>> getUserData(int userId) async {
    try {
      // int userId = await SharedPrefHelper.getSecuredString(
      //     SharedPrefKeys.userID); // Replace with the actual user ID
      final response = await _apiService.getUserData(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<EditProfileResponseModel>> updateUserData(
    EditProfileRequestModel editProfileRequestModel,
    File? photoFile,
  ) async {
    try {
      final response = await _apiService.updateUserData(
          editProfileRequestModel.id,
          editProfileRequestModel.fullName,
          editProfileRequestModel.email,
          editProfileRequestModel.phone,
          editProfileRequestModel.universityId ?? '',
          editProfileRequestModel.password,
          photoFile);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
