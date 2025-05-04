import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';

part 'lost_and_my_lost_state.freezed.dart';

@freezed
class LostAndMyLostState with _$LostAndMyLostState {
  const factory LostAndMyLostState.initial() = _Initial;

  // All Lost
  const factory LostAndMyLostState.allLostLoading() = AllLostLoading;
  const factory LostAndMyLostState.allLostSuccess(
      AllLostBodyResponseModel allLostBodyResponseModel) = AllLostSuccess;
  const factory LostAndMyLostState.allLostError(ErrorHandler errorHandler) =
      AllLostError;
  // All My Lost and Found
  const factory LostAndMyLostState.allMyReportsLoading() = AllMyReportsLoading;
  const factory LostAndMyLostState.allMyReportsSuccess(
      AllLostBodyResponseModel allLostBodyResponseModel) = AllMyReportsSuccess;
  const factory LostAndMyLostState.allMyReportsError(
      ErrorHandler errorHandler) = AllMyReportsError;
  //  states for delete operations
  const factory LostAndMyLostState.deleteReportLoading() = DeleteReportLoading;
  const factory LostAndMyLostState.deleteReportSuccess(String message) =
      DeleteReportSuccess;
  const factory LostAndMyLostState.deleteReportError(
      ErrorHandler errorHandler) = DeleteReportError;
}
