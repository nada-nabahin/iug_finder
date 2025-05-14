import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/data/repos/all_lost_repo.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit._state.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_state.dart';

class AllLostAndFoundCubit extends Cubit<AllLostAndFoundState> {
  final AllLostAdminRepo _allLostAdminRepo;
  final TextEditingController searchController = TextEditingController();
  List<Report> _allLostReports = []; // Store original
  List<Report> get allLostReports => _allLostReports;
  List<Report> _myReports = []; // Store original data for my reports

  AllLostAndFoundCubit(this._allLostAdminRepo)
      : super(const AllLostAndFoundState.initial());
  // get all reports lost for user
  void getAllLost() async {
    emit(const AllLostAndFoundState.allLostLoading());
    final response = await _allLostAdminRepo.getAllLost();
    response.when(
      success: (allLostResponseModel) {
        _allLostReports =
            allLostResponseModel.reports ?? []; // Store original data
        emit(AllLostAndFoundState.allLostSuccess(allLostResponseModel));
      },
      failure: (errorHandler) {
        emit(AllLostAndFoundState.allLostError(errorHandler));
      },
    );
  }

  // get all my reports lost and found for user
  void getAllFoundReport() async {
    emit(const AllLostAndFoundState.allMyReportsLoading());
    final response = await _allLostAdminRepo.getAllFound();
    response.when(
      success: (allMyReportsResponseModel) {
        _myReports = allMyReportsResponseModel.reports ?? [];
        emit(AllLostAndFoundState.allMyReportsSuccess(
            allMyReportsResponseModel));
      },
      failure: (errorHandler) {
        emit(AllLostAndFoundState.allMyReportsError(errorHandler));
      },
    );
  }

// Add this method to your cubit
  void filterAllLost(String query) {
    emit(const AllLostAndFoundState.allLostLoading());
    if (query.isEmpty) {
      emit(AllLostAndFoundState.allLostSuccess(
          AllLostBodyResponseModel(reports: _allLostReports)));
      return;
    }

    final filtered = _allLostReports.where((report) {
      return report.location!.contains(query) ||
          report.itemType!.contains(query) ||
          report.description!.contains(query);
    }).toList();

    emit(AllLostAndFoundState.allLostSuccess(
        AllLostBodyResponseModel(reports: filtered)));
  }

  // Filter method for my reports
  void filterMyReports(String query) {
    emit(const AllLostAndFoundState.allMyReportsLoading());

    if (query.isEmpty) {
      emit(AllLostAndFoundState.allMyReportsSuccess(
          AllLostBodyResponseModel(reports: _myReports)));
      return;
    }

    final filtered = _myReports.where((report) {
      return report.location!.contains(query) ||
          report.itemType!.contains(query) ||
          report.description!.contains(query);
    }).toList();

    emit(AllLostAndFoundState.allMyReportsSuccess(
        AllLostBodyResponseModel(reports: filtered)));
  }

  void clearSearchField() {
    searchController.clear();
  }

  Future<void> deleteReport(int reportId) async {
    try {
      emit(const AllLostAndFoundState.deleteReportLoading());

      // Optimistic update
      final originalReports = List<Report>.from(_myReports);
      _myReports.removeWhere((report) => report.reportID == reportId);
      emit(AllLostAndFoundState.allMyReportsSuccess(
        AllLostBodyResponseModel(reports: _myReports),
      ));

      final response = await _allLostAdminRepo.deleteReport(reportId);
      response.when(
        success: (deleteReportResponse) {
          emit(AllLostAndFoundState.deleteReportSuccess(deleteReportResponse));
        },
        failure: (error) {
          // Revert on failure
          _myReports = originalReports;
          emit(AllLostAndFoundState.deleteReportError(error));
          emit(AllLostAndFoundState.allMyReportsSuccess(
            AllLostBodyResponseModel(reports: _myReports),
          ));
        },
      );
    } catch (e) {
      emit(AllLostAndFoundState.deleteReportError(ErrorHandler.handle(e)));
    }
  }
}
