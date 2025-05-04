import 'package:dio/dio.dart';

import 'package:iug_finder/core/networking/api_constanta.dart';
import 'package:iug_finder/features/login/data/models/login_req_body.dart';
import 'package:iug_finder/features/login/data/models/login_res_body.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
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

  @DELETE("${ApiConstanta.deleteReport}/{id}")
  Future<void> deleteReport(@Path() int id);
}
