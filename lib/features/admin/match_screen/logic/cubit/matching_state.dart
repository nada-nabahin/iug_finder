import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/features/admin/match_screen/data/models/matchine_model_response.dart';

part 'matching_state.freezed.dart';

@freezed
class MatchingState with _$MatchingState {
  const factory MatchingState.initial() = _Initial;
  const factory MatchingState.loading() = Loading;
  const factory MatchingState.success(
      MatchingModelResponse matchingModelResponse) = Success;
  const factory MatchingState.error(ErrorHandler errorHandler) = Error;
}
