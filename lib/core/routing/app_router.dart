import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iug_finder/core/di/dependency_injection.dart';
import 'package:iug_finder/features/admin/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/admin/home/navigation_bar.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/logic/cubit/lost_and_my_founa_cubit.dart';
import 'package:iug_finder/features/admin/lost_and_my_lost/lost_and_my_lost.dart';
import 'package:iug_finder/features/contact_us_screen/contact_us.dart';
import 'package:iug_finder/features/create_report.dart/logic/cubit/create_report_cubit.dart';
import 'package:iug_finder/features/create_report.dart/ui/create_report.dart';
import 'package:iug_finder/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:iug_finder/features/edit_profile_screen/logic/cubit/get_user_data_cubit.dart';
import 'package:iug_finder/features/home/home_screen.dart';
import 'package:iug_finder/features/home/logic/cubit/navigation_bar_cubit.dart';
import 'package:iug_finder/features/login/logic/cubit/login_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/data/model/all_lost_body_response.dart';
import 'package:iug_finder/features/lost_and_my_lost/logic/cubit/lost_and_my_lost_cubit.dart';
import 'package:iug_finder/features/lost_and_my_lost/lost_and_my_lost.dart';
import 'package:iug_finder/features/create_report.dart/ui/widget/edit/edit_report.dart';
import 'package:iug_finder/features/lost_and_my_lost/widget/my_lost_tab/my_lost_tab_screen.dart';
import 'package:iug_finder/features/notifcation_screen/notification_screen.dart';
import 'package:iug_finder/features/profile_screen/profile_screen.dart';
import 'package:iug_finder/core/routing/routers.dart';
import 'package:iug_finder/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:iug_finder/features/sign_up/ui/sign_up_screen.dart';
import 'package:iug_finder/features/home/navigation_bar.dart';

import '../../features/login/ui/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routers.navigationBar:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => NavigationBarCubit(),
                  child: const BottomNavigationBarr(),
                ));
      case Routers.navigationBarAdmin:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => NavigationBarAdminCubit(),
                  child: const BottomNavigationBarrAdmin(),
                ));
      case Routers.editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GetUserDataCubit(getIt())..getUserData(),
                  child: const EditProfileScreen(),
                ));
      case Routers.contactUsScreen: // Add the signup route case
        return MaterialPageRoute(builder: (context) => const ContactUsScreen());
      case Routers.notificationScreen: // Add the signup route case
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());
      case Routers.homeScreen: // Add the signup route case
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => NavigationBarCubit(),
                  child: const HomeScreen(),
                ));
      case Routers.loginScreen: // Add the signup route case
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routers.signupScreen: // Add the signup route case
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignupScreen(),
                ));
      case Routers.lostScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      LostAndMyLostCubit(getIt())..getAllLost(),
                  child: const LostAndMyLost(),
                ));
      case Routers.lostScreenAdmin:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      AllLostAndFoundCubit(getIt())..getAllLost(),
                  child: const LostAndMyFoundAdmin(),
                ));
      case Routers.createReportScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => CreateReportCubit(getIt()),
                  child: const CreateReportScreen(),
                ));
      case Routers.editReportScreen:
        final Report? report = settings.arguments as Report?;
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => CreateReportCubit(getIt()),
                  child: EditReportScreen(reportToEdit: report),
                ));
      case Routers.myReportsScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      LostAndMyLostCubit(getIt())..getMyReports(),
                  child: const MyLostTabScreen(),
                ));
      default:
        return null;
    }
  }
}
