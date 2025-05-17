import 'dart:io';

import 'package:dio/dio.dart';

import 'package:iug_finder/core/networking/api_constanta.dart';
import 'package:iug_finder/features/admin/match_screen/data/models/matchine_model_response.dart';
import 'package:iug_finder/features/create_report.dart/data/models/create_report_response.dart';
import 'package:iug_finder/features/create_report.dart/data/models/edit_report_response.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/edit_profile_response_model.dart';
import 'package:iug_finder/features/login/data/models/login_req_body.dart';
import 'package:iug_finder/features/login/data/models/login_res_body.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/delete_report_response.dart';
import 'package:iug_finder/features/edit_profile_screen/data/model/profile_response_model.dart';
import 'package:iug_finder/features/sign_up/data/model/signup_req_body.dart';
import 'package:iug_finder/features/sign_up/data/model/signup_res.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstanta.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstanta.login)
  Future<LoginResponse> login(
    @Body() LoginReqBody loginReqBody,
  );

  @POST(ApiConstanta.register)
  Future<SignupResponse> register(
    @Body() SignupRequestBody signupRequestBody,
  );

  @GET(ApiConstanta.allLost)
  Future<AllLostBodyResponseModel> getAllLost();

  @GET(ApiConstanta.myReports)
  Future<AllLostBodyResponseModel> getMyReports();

  @MultiPart()
  @POST(ApiConstanta.createReport)
  Future<CreateReportModelResponse> createReport(
    @Part(name: 'status') String lostType,
    @Part(name: 'item_type') String itemType,
    @Part(name: 'color') String color,
    @Part(name: 'report_date') String reportDate,
    @Part(name: 'report_time') String reportTime,
    @Part(name: 'location') String location,
    @Part(name: 'description') String description,
    @Part(name: 'photo') File? photo,
  );

  @DELETE("${ApiConstanta.deleteReport}/{id}")
  Future<DeleteReportResponse> deleteReport(@Path() int id);

  @MultiPart()
  @PUT("${ApiConstanta.editReport}/{id}")
  Future<EditReportModelResponse> editReport(
    @Path() int id,
    @Part(name: 'status') String lostType,
    @Part(name: 'item_type') String itemType,
    @Part(name: 'color') String color,
    @Part(name: 'report_date') String reportDate,
    @Part(name: 'report_time') String reportTime,
    @Part(name: 'location') String location,
    @Part(name: 'description') String description,
    @Part(name: 'photo') File? photo,
  );

  @GET("${ApiConstanta.getUserData}/{id}")
  Future<ProfileResponseModel> getUserData(@Path() int id);

  @MultiPart()
  @PUT("${ApiConstanta.editUserData}/{id}")
  Future<EditProfileResponseModel> updateUserData(
    @Path() int id,
    @Part(name: 'full_name') String fullName,
    @Part(name: 'email') String email,
    @Part(name: 'phone') String phone,
    @Part(name: 'university_id') String universityId,
    @Part(name: 'password') String? password,
    @Part(name: 'photo') File? photo,
  );

  @GET(ApiConstanta.allFound)
  Future<AllLostBodyResponseModel> getAllFound();

  @GET(ApiConstanta.matching)
  Future<MatchingModelResponse> getMatching();
}
