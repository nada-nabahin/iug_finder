import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/core/networking/api_result.dart';
import 'package:iug_finder/core/networking/api_service.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';

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
  Future<ApiResult<dynamic>> deleteReport(int reportId) async {
    try {
      await _apiService.deleteReport(reportId);
      return const ApiResult.success("تم حذف اليلاغ بنجاح");
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
