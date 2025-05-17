import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/di/dependency_injection.dart';
import 'package:iug_finder/core/helpers/constants.dart';
import 'package:iug_finder/core/helpers/extension.dart';
import 'package:iug_finder/core/helpers/shared_pref_helper.dart';
import 'package:iug_finder/core/networking/firebase_api.dart';
import 'package:iug_finder/core/routing/app_router.dart';
import 'package:iug_finder/core/theming/colors.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';

import 'core/routing/routers.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  await checkIfLoggedInUser();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: ColorsManager.mainBlue, // Set your desired color
      statusBarIconBrightness:
          Brightness.light, // Light icons for dark background
      statusBarBrightness: Brightness.dark, // For iOS
    ),
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('ar'),
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}

checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  String? userRole = await SharedPrefHelper.getSecuredString(
      SharedPrefKeys.role); // Add user role check

  print('User Token: $userToken'); // Debugging
  print('User Role: $userRole'); // Debugging

  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
    isAdminUser = userRole == 'admin';
  } else {
    isLoggedInUser = false;
    isAdminUser = false;
  }
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<GetUserDataCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<LostAndMyLostCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<NavigationBarAdminCubit>(),
          ),
        ],
        child: MaterialApp(
          title: tr('app_title'),
          theme: ThemeData(
              primaryColor: ColorsManager.mainBlue,
              scaffoldBackgroundColor: ColorsManager.white),
          debugShowCheckedModeBanner: false,
          // initialRoute: Routers.navigationBarAdmin,
          initialRoute: isLoggedInUser
              ? (isAdminUser
                  ? Routers.navigationBarAdmin
                  : Routers.navigationBar)
              : Routers.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        ),
      ),
    );
  }
}
