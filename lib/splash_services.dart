import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../app/routes/routes_name.dart';

class SplashService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> checkLoginStatus(BuildContext context) async {
    await Future.delayed(Duration(seconds: 5));

    User? user = _auth.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, RoutesName.navigationBar);
    } else {
      Navigator.pushReplacementNamed(context, RoutesName.login);
    }
  }
}
