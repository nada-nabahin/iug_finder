import 'dart:io';

import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/core/networking/api_result.dart';
import 'package:iug_finder/core/networking/api_service.dart';
import 'package:iug_finder/features/create_report.dart/data/models/create_report_request.dart';
import 'package:iug_finder/features/create_report.dart/data/models/create_report_response.dart';
import 'package:iug_finder/features/create_report.dart/data/models/edit_report_response.dart';

class CreateReportRepo {
  final ApiService _apiService;

  CreateReportRepo(this._apiService);

  Future<ApiResult<CreateReportModelResponse>> createReport(
      CreateReportModelRequest createReportModelRequest,
      File? photoFile) async {
    try {
      final response = await _apiService.createReport(
          createReportModelRequest.lostType,
          createReportModelRequest.itemType,
          createReportModelRequest.color,
          createReportModelRequest.reportDate,
          createReportModelRequest.reportTime,
          createReportModelRequest.location,
          createReportModelRequest.description,
          photoFile);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<EditReportModelResponse>> editReport(
    CreateReportModelRequest createReportModelRequest,
    File? photoFile,
  ) async {
    try {
      final response = await _apiService.editReport(
        createReportModelRequest.id!,
        createReportModelRequest.lostType,
        createReportModelRequest.itemType,
        createReportModelRequest.color,
        createReportModelRequest.reportDate,
        createReportModelRequest.reportTime,
        createReportModelRequest.location,
        createReportModelRequest.description,
        photoFile,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
