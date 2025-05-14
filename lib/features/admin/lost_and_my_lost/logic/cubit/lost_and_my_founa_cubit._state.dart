import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/delete_report_response.dart';

part 'lost_and_my_founa_cubit._state.freezed.dart';

@freezed
class AllLostAndFoundState with _$AllLostAndFoundState {
  const factory AllLostAndFoundState.initial() = _Initial;

  // All Lost
  const factory AllLostAndFoundState.allLostLoading() = AllLostLoading;
  const factory AllLostAndFoundState.allLostSuccess(
      AllLostBodyResponseModel allLostBodyResponseModel) = AllLostSuccess;
  const factory AllLostAndFoundState.allLostError(ErrorHandler errorHandler) =
      AllLostError;
  // All My Lost and Found
  const factory AllLostAndFoundState.allMyReportsLoading() =
      AllMyReportsLoading;
  const factory AllLostAndFoundState.allMyReportsSuccess(
      AllLostBodyResponseModel allLostBodyResponseModel) = AllMyReportsSuccess;
  const factory AllLostAndFoundState.allMyReportsError(
      ErrorHandler errorHandler) = AllMyReportsError;
  //  states for delete operations
  const factory AllLostAndFoundState.deleteReportLoading() =
      DeleteReportLoading;
  const factory AllLostAndFoundState.deleteReportSuccess(
      DeleteReportResponse deleteReportResponse) = DeleteReportSuccess;
  const factory AllLostAndFoundState.deleteReportError(
      ErrorHandler errorHandler) = DeleteReportError;
}
