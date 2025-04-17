import 'package:flutter/material.dart';
import 'package:iug_finder/features/contact_us_screen/contact_us.dart';
import 'package:iug_finder/features/edit_profile_screen/edit_profile_screen.dart';
import 'package:iug_finder/features/notifcation_screen/notification_screen.dart';
import 'package:iug_finder/features/profile_screen/profile_screen.dart';
import 'package:iug_finder/core/routing/routers.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case Routers.editProfileScreen:
        return MaterialPageRoute(
            builder: (context) => const EditProfileScreen());
      case Routers.contactUsScreen: // Add the signup route case
        return MaterialPageRoute(builder: (context) => const ContactUsScreen());
      case Routers.notificationScreen: // Add the signup route case
        return MaterialPageRoute(
            builder: (context) => const NotificationScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
