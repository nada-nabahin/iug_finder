import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:iug_finder/core/networking/dio_factory.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/data/repos/all_lost_repo.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit.dart';
import 'package:iug_finder/features/admin/match_screen/data/repos/matching_repo.dart';
import 'package:iug_finder/features/admin/match_screen/logic/cubit/matching_cubit.dart';
import 'package:iug_finder/features/create_report.dart/data/repo/create_report_repos.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_cubit.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/login/logic/cubit/login_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/repos/all_lost_repo.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/edit_profile_screen/data/repos/profile_repo.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_cubit.dart';
import 'package:iug_finder/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:iug_finder/features/sign_up/logic/cubit/signup_cubit.dart';

import '../../features/login/data/repos/login_repos.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;
Future<void> setupGetIt() async {
// dio & api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
// login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
// signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
// lost
  getIt.registerLazySingleton<AllLostRepo>(() => AllLostRepo(getIt()));
  getIt.registerFactory<LostAndMyLostCubit>(
      () => LostAndMyLostCubit(getIt())..getAllLost());
// create report
  getIt
      .registerLazySingleton<CreateReportRepo>(() => CreateReportRepo(getIt()));
  getIt.registerFactory<CreateReportCubit>(() => CreateReportCubit(getIt()));
// profile
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<GetUserDataCubit>(() => GetUserDataCubit(getIt()));

// navigation bar
  getIt
      .registerLazySingleton<AllLostAdminRepo>(() => AllLostAdminRepo(getIt()));
  getIt.registerFactory<AllLostAndFoundCubit>(
      () => AllLostAndFoundCubit(getIt())..getAllLost());

  getIt.registerFactory<NavigationBarAdminCubit>(
      () => NavigationBarAdminCubit());

  //matching
  getIt.registerLazySingleton<MatchingRepo>(() => MatchingRepo(getIt()));
  getIt.registerFactory<MatchingCubit>(() => MatchingCubit(getIt()));
}
