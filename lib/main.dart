import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iug_finder/core/routing/app_router.dart';
import 'package:iug_finder/core/theming/colors.dart';

import 'core/routing/routers.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'IUG Finder',
        theme: ThemeData(
            primaryColor: ColorsManager.mainBlue,
            scaffoldBackgroundColor: ColorsManager.white),
        debugShowCheckedModeBanner: false,
        initialRoute: Routers.profileScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
