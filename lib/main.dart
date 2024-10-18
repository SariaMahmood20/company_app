

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/navigation/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 895),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: lightTheme, // Apply the lightTheme here
          onGenerateRoute: Routes.generateRoutes,
          initialRoute: RouteNames.navigationBar,
        );
      },
    );
  }
}
