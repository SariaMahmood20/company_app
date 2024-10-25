import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:deutics_attendance_app/features/auth/data/services/auth_services.dart';
import 'package:deutics_attendance_app/app/navigation/route_names.dart';

class SplashService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> checkLoginStatus(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    final user = _auth.currentUser;
    if (user != null) {
      SessionController().userId = user.uid.toString();
      Navigator.pushReplacementNamed(context, RouteNames.navigationBar);
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.login);
    }
  }
}