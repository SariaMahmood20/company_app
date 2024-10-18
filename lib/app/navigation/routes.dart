import 'package:deutics_attendance_app/app/views/widget/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/splash.dart';
import 'package:deutics_attendance_app/error_screen.dart';
import 'package:deutics_attendance_app/features/posts/presentation/views/post_screen.dart';
import 'package:deutics_attendance_app/features/leaves/presentation/views/application_record_screen.dart';
import 'package:deutics_attendance_app/features/leaves/presentation/views/write_application_screen.dart';
import 'package:deutics_attendance_app/features/user/presentation/views/password_setting_screen.dart';
import 'package:deutics_attendance_app/features/user/presentation/views/profile_settings_screen.dart';
import 'package:deutics_attendance_app/features/user/presentation/views/user_screen.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RouteNames.splash:
        return MaterialPageRoute(builder: (BuildContext context)=> const SplashScreen());
      case RouteNames.post:
        return MaterialPageRoute(builder: (BuildContext context)=>const PostScreen());
      case RouteNames.application:
        return MaterialPageRoute(builder: (BuildContext context)=> const ApplicationRecordScreen());
      case RouteNames.newApplication:
        return MaterialPageRoute(builder: (BuildContext context)=> WriteApplicationScreen());
      case RouteNames.settings:
        return MaterialPageRoute(builder: (BuildContext context)=> const UserScreen());
      case RouteNames.profileSettings:
        return MaterialPageRoute(builder: (BuildContext context)=> ProfileSettingsScreen());
      case RouteNames.passwordSettings:
        return MaterialPageRoute(builder: (BuildContext context)=> const PasswordSettingScreen());
      case RouteNames.navigationBar:
        return MaterialPageRoute(builder: (BuildContext context)=> const MyNavigationBar());
      default:
        return MaterialPageRoute(builder: (BuildContext context)=> const ErrorScreen());
    }
  }
}