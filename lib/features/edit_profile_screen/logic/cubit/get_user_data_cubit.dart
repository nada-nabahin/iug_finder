import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iug_finder/core/helpers/constants.dart';
import 'package:iug_finder/core/helpers/shared_pref_helper.dart';
import 'package:iug_finder/core/networking/api_error_handler.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/edit_profile_request_model.dart';
import 'package:iug_finder/features/edit_profile_screen/data/repos/profile_repo.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_state.dart';
import 'package:path_provider/path_provider.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  final ProfileRepo _profileRepo;

  GetUserDataCubit(this._profileRepo) : super(const GetUserDataState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? imagePath;
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  File? selectedImage;

  Future<void> getUserData() async {
    emit(const GetUserDataState.loading());
    String userIdString =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userID);
    int userId = int.parse(userIdString);
    final response = await _profileRepo.getUserData(userId);
    response.when(
      success: (userDataResponseModel) {
        nameController.text = userDataResponseModel.user.fullName;
        numberController.text = userDataResponseModel.user.universityId;
        phoneController.text = userDataResponseModel.user.phone;
        emailController.text = userDataResponseModel.user.email;
        imagePath = userDataResponseModel.user.photo;
        emit(GetUserDataState.success(userDataResponseModel));
      },
      failure: (errorHandler) {
        emit(GetUserDataState.error(
            error: errorHandler.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> pickAndSetImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? xfile = await picker.pickImage(source: ImageSource.gallery);
      if (xfile != null) {
        selectedImage = File(xfile.path);
        if (await selectedImage!.exists()) {
          emit(GetUserDataState.imagePicked(selectedImage!));
        } else {
          emit(const GetUserDataState.error(error: 'Image file not found'));
        }
      }
    } catch (e) {
      emit(const GetUserDataState.error(error: 'Failed to pick image'));
    }
  }

  Future<void> updateUserData() async {
    emit(const GetUserDataState.loading());
    print('Updating user data...');
    print('Name: ${nameController.text}');
    print('University ID: ${numberController.text}');
    print('Phone: ${phoneController.text}');
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');
    print('Image: ${selectedImage?.path}');
    String userIdString =
        await SharedPrefHelper.getSecuredString(SharedPrefKeys.userID);
    int userId = int.parse(userIdString);
    print('user $userId');

    File? imageToSend = selectedImage;
    if (imageToSend == null && imagePath != null) {
      try {
        imageToSend = await downloadAndCacheImage(
            'http://11.11.11.74:3000/uploads/$imagePath');
      } catch (e) {
        print('Error downloading image: $e');
      }
    }
    final response = await _profileRepo.updateUserData(
      EditProfileRequestModel(
        id: userId,
        fullName: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        universityId: numberController.text,
        password:
            passwordController.text.isNotEmpty ? passwordController.text : '',
      ),
      imageToSend,
    );
    response.when(
      success: (editProfileResponseModel) async {
        await getUserData();
      },
      failure: (errorHandler) {
        emit(GetUserDataState.error(
            error: errorHandler.apiErrorModel.message ?? ''));
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
    emit(GetUserDataState.imagePicked(image));
  }

  deleteTokenFromSharedPreferences() async {
    await SharedPrefHelper.removeData(SharedPrefKeys.role);
    await SharedPrefHelper.removeData(SharedPrefKeys.userToken);
    await SharedPrefHelper.removeData(SharedPrefKeys.userID);
    await SharedPrefHelper.removeData(SharedPrefKeys.userName);
    await SharedPrefHelper.removeData(SharedPrefKeys.role);

    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.removeData(SharedPrefKeys.role);
    await SharedPrefHelper.clearAllData();
  }
}
