import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/features/admin/match_screen/data/models/matchine_model_response.dart';
import 'package:iug_finder/features/admin/match_screen/data/repos/matching_repo.dart';
import 'package:iug_finder/features/admin/match_screen/logic/cubit/matching_state.dart';

class MatchingCubit extends Cubit<MatchingState> {
  final MatchingRepo _matchingRepo;
  final TextEditingController searchController = TextEditingController();

  List<MatchData> _allMatchingData = []; // Store original data
  List<MatchData> get allMatchingData => _allMatchingData;

  MatchingCubit(this._matchingRepo) : super(const MatchingState.initial());

  // Fetch all matching data
  void getAllMatching() async {
    emit(const MatchingState.loading());
    final response = await _matchingRepo.getMatching();
    response.when(
      success: (matchingModelResponse) {
        _allMatchingData = matchingModelResponse.data; // Store original data
        emit(MatchingState.success(matchingModelResponse));
      },
      failure: (errorHandler) {
        emit(MatchingState.error(errorHandler));
      },
    );
  }
}
