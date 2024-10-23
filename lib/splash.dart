
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 5), 
      (){
        Navigator.pushReplacementNamed(context, RouteNames.login);
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome to the Deutics Global!",
          style: styles.roboto20w400,
        ),
      ),
    );
  }
}
