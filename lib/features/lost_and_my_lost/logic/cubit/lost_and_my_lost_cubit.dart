import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/repos/all_lost_repo.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_state.dart';

class LostAndMyLostCubit extends Cubit<LostAndMyLostState> {
  final AllLostRepo _allLostRepo;
  final TextEditingController searchController = TextEditingController();
  List<Report> _allLostReports = []; // Store original
  List<Report> get allLostReports => _allLostReports;
  List<Report> _myReports = []; // Store original data for my reports

  LostAndMyLostCubit(this._allLostRepo)
      : super(const LostAndMyLostState.initial());
  // get all reports lost for user
  void getAllLost() async {
    emit(const LostAndMyLostState.allLostLoading());
    final response = await _allLostRepo.getAllLost();
    response.when(
      success: (allLostResponseModel) {
        _allLostReports =
            allLostResponseModel.reports ?? []; // Store original data
        emit(LostAndMyLostState.allLostSuccess(allLostResponseModel));
      },
      failure: (errorHandler) {
        emit(LostAndMyLostState.allLostError(errorHandler));
      },
    );
  }

  // get all my reports lost and found for user
  void getMyReports() async {
    emit(const LostAndMyLostState.allMyReportsLoading());
    final response = await _allLostRepo.getMyReports();
    response.when(
      success: (allMyReportsResponseModel) {
        _myReports = allMyReportsResponseModel.reports ?? [];
        emit(LostAndMyLostState.allMyReportsSuccess(allMyReportsResponseModel));
      },
      failure: (errorHandler) {
        emit(LostAndMyLostState.allMyReportsError(errorHandler));
      },
    );
  }

// Add this method to your cubit
  void filterAllLost(String query) {
    emit(const LostAndMyLostState.allLostLoading());
    if (query.isEmpty) {
      emit(LostAndMyLostState.allLostSuccess(
          AllLostBodyResponseModel(reports: _allLostReports)));
      return;
    }

    final filtered = _allLostReports.where((report) {
      return report.location!.contains(query) ||
          report.itemType!.contains(query) ||
          report.description!.contains(query);
    }).toList();

    emit(LostAndMyLostState.allLostSuccess(
        AllLostBodyResponseModel(reports: filtered)));
  }

  // Filter method for my reports
  void filterMyReports(String query) {
    emit(const LostAndMyLostState.allMyReportsLoading());

    if (query.isEmpty) {
      emit(LostAndMyLostState.allMyReportsSuccess(
          AllLostBodyResponseModel(reports: _myReports)));
      return;
    }

    final filtered = _myReports.where((report) {
      return report.location!.contains(query) ||
          report.itemType!.contains(query) ||
          report.description!.contains(query);
    }).toList();

    emit(LostAndMyLostState.allMyReportsSuccess(
        AllLostBodyResponseModel(reports: filtered)));
  }

  void clearSearchField() {
    searchController.clear();
  }

  Future<void> deleteReport(int reportId) async {
    try {
      emit(const LostAndMyLostState.deleteReportLoading());

      // Optimistic update
      final originalReports = List<Report>.from(_myReports);
      _myReports.removeWhere((report) => report.reportID == reportId);
      emit(LostAndMyLostState.allMyReportsSuccess(
        AllLostBodyResponseModel(reports: _myReports),
      ));

      final response = await _allLostRepo.deleteReport(reportId);
      response.when(
        success: (message) {
          emit(const LostAndMyLostState.deleteReportSuccess('تم الحذف بنجاح'));
        },
        failure: (error) {
          // Revert on failure
          _myReports = originalReports;
          emit(LostAndMyLostState.deleteReportError(error));
          emit(LostAndMyLostState.allMyReportsSuccess(
            AllLostBodyResponseModel(reports: _myReports),
          ));
        },
      );
    } catch (e) {
      emit(LostAndMyLostState.deleteReportError(ErrorHandler.handle(e)));
    }
  }
}
