import 'dart:async';
import 'package:deutics_attendance_app/features/auth/data/services/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../app/routes/routes_name.dart';

class SplashService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> checkLoginStatus(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));

    final user = _auth.currentUser;
    if (user != null) {
      SessionController().userId = user.uid.toString();
      Navigator.pushReplacementNamed(context, RoutesName.navigationBar);
    } else {
      Navigator.pushReplacementNamed(context, RoutesName.login);
    }
  }
}
