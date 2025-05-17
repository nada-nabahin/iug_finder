import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/core/networking/api_result.dart';
import 'package:iug_finder/core/networking/api_service.dart';
import 'package:iug_finder/features/admin/match_screen/data/models/matchine_model_response.dart';

class MatchingRepo {
  final ApiService _apiService;

  MatchingRepo(this._apiService);

  Future<ApiResult<MatchingModelResponse>> getMatching() async {
    try {
      final response = await _apiService.getMatching();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
