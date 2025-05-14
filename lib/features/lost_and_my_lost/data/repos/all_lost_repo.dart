import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/core/networking/api_result.dart';
import 'package:iug_finder/core/networking/api_service.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/delete_report_response.dart';

class AllLostRepo {
  final ApiService _apiService;

  AllLostRepo(this._apiService);

  Future<ApiResult<AllLostBodyResponseModel>> getAllLost() async {
    try {
      final response = await _apiService.getAllLost();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<AllLostBodyResponseModel>> getMyReports() async {
    try {
      final response = await _apiService.getMyReports();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // In AllLostRepo
  Future<ApiResult<DeleteReportResponse>> deleteReport(int reportId) async {
    try {
      final response = await _apiService.deleteReport(reportId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
