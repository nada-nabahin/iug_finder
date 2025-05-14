import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iug_finder/core/function/upload_image_to_api.dart';
import 'package:iug_finder/core/networking/api_service.dart';
import 'package:iug_finder/features/create_report.dart/data/models/create_report_request.dart';
import 'package:iug_finder/features/create_report.dart/data/repo/create_report_repos.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_state.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:path_provider/path_provider.dart';

class CreateReportCubit extends Cubit<CreateReportState> {
  final CreateReportRepo _createReportRepo;
  CreateReportCubit(this._createReportRepo)
      : super(const CreateReportState.initial());

  final formKey = GlobalKey<FormState>();
  final statusController = TextEditingController();
  final itemTypeController = TextEditingController();
  final colorController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  File? selectedImage;
  int? reportId; // Add this line to store the ID

  void emitCreateReportStates() async {
    emit(const CreateReportState.loading());
    final response = await _createReportRepo.createReport(
      CreateReportModelRequest(
        lostType: statusController.text,
        itemType: itemTypeController.text,
        color: colorController.text,
        description: descriptionController.text,
        location: locationController.text,
        reportDate: dateController.text,
        reportTime: timeController.text,
      ),
      selectedImage,
    );

    response.when(
      success: (createReportResponse) async {
        emit(CreateReportState.success(createReportResponse));
        clearForm();
      },
      failure: (error) {
        emit(CreateReportState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  void emitEditReportStates() async {
    emit(const CreateReportState.loading());
    final response = await _createReportRepo.editReport(
      CreateReportModelRequest(
        id: reportId, // Get the ID from the report being edited
        lostType: statusController.text,
        itemType: itemTypeController.text,
        color: colorController.text,
        description: descriptionController.text,
        location: locationController.text,
        reportDate: dateController.text,
        reportTime: timeController.text,
      ),
      selectedImage,
    );

    response.when(
      success: (createReportResponse) async {
        emit(CreateReportState.success(createReportResponse));
        clearForm();
      },
      failure: (error) {
        emit(CreateReportState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  // In CreateReportCubit
  Future<File> downloadAndCacheImage(String url) async {
    final response = await Dio().get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final tempDir = await getTemporaryDirectory();
    final file =
        File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
    await file.writeAsBytes(response.data);
    return file;
  }

  void setSelectedImage(File image) {
    selectedImage = image;
    emit(CreateReportState.imagePicked(image));
  }

  void clearForm() {
    statusController.clear();
    itemTypeController.clear();
    colorController.clear();
    dateController.clear();
    timeController.clear();
    locationController.clear();
    descriptionController.clear();
    selectedImage = null;
    emit(const CreateReportState.initial()); // Or a new state like ImageCleared
  }

  Future<void> pickAndSetImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
    if (xfile != null) {
      selectedImage = File(xfile.path);
      if (await selectedImage!.exists()) {
        emit(CreateReportState.imagePicked(selectedImage));
      } else {
        emit(const CreateReportState.error(error: "Invalid image file"));
      }
    }
  }

  // Future<File> downloadImage(String url) async {
  //   final response = await Dio().get(
  //     url,
  //     options: Options(responseType: ResponseType.bytes),
  //   );
  //   final tempDir = await getTemporaryDirectory();
  //   File file =
  //       File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg');
  //   await file.writeAsBytes(response.data);
  //   return file;
  // }

  // void setImageFile(File image) {
  //   selectedImage = image;
  //   emit(CreateReportState.imagePicked(image));
  // }

  @override
  Future<void> close() {
    statusController.dispose();
    itemTypeController.dispose();
    colorController.dispose();
    dateController.dispose();
    timeController.dispose();
    locationController.dispose();
    descriptionController.dispose();
    selectedImage = null;
    return super.close();
  }
}
