import 'package:deutics_attendance_app/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signin_view.dart';
import '../../features/leaves/views/application_record_screen.dart';
import '../../features/leaves/views/write_application_screen.dart';
import '../../features/posts/presentation/views/post_screen.dart';
import '../../features/user/views/password_setting_screen.dart';
import '../../features/user/views/profile_settings_screen.dart';
import '../../features/user/views/user_screen.dart';
import 'package:deutics_attendance_app/app/views/widget/navigation_bar.dart';
import '../../splash.dart';


class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name){
      case RoutesName.post:
        return MaterialPageRoute(builder: (context) => PostScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.signUp:
        return MaterialPageRoute(builder: (context) => const SignInView());
      case RouteNames.navigationBar:
        return MaterialPageRoute(builder: (context)=> const MyNavigationBar());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesName.application:
        return MaterialPageRoute(builder: (context) => const ApplicationRecordScreen());
      case RoutesName.newApplication:
        return MaterialPageRoute(builder: (context) => WriteApplicationScreen());
      case RoutesName.checkIn:
        return MaterialPageRoute(builder: (context) => const ApplicationRecordScreen());
      case RoutesName.userProfile:
        return MaterialPageRoute(builder: (context) => const UserScreen());
      case RoutesName.setting:
        return MaterialPageRoute(builder: (context) => ProfileSettingsScreen());
      case RoutesName.changePassword:
        return MaterialPageRoute(builder: (context) => const PasswordSettingScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("NO ROUTE DEFINE"),
            ),
          );
        }
      );
    }
  }
}