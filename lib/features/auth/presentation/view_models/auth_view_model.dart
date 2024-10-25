import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/utils/utils_function.dart';
import 'package:deutics_attendance_app/features/auth/data/services/auth_services.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  
  Future<void> registerUser({
  required String firstName,
  required String lastName,
  required String designation,
  required String email,
  required String password,
  required BuildContext context,
}) async {
  setLoading(true);
  if (email.isEmpty || password.isEmpty) {
    setLoading(false);
    UtilsFunction.showFlushbarMessage(context, Colors.red, "Email and password cannot be empty");
    return;
  }

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    // Only add user data to the database if registration is successful
    ref.child(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'name': "$firstName $lastName",
      'designation': designation,
      'email': userCredential.user!.email,
      'imgUrl': 'https://www.sefram.com/images/products/photos/hi_res/7202.jpg',
      'about': 'Hi, I am a Flutter Developer at Deutics Global!',
    });

    setLoading(false);
    UtilsFunction.showFlushbarMessage(context, Colors.green, "User created successfully");
    Navigator.pushNamed(context, RouteNames.login);
  } on FirebaseAuthException catch (e) {
    setLoading(false);
    UtilsFunction.showFlushbarMessage(context, Colors.red, "Error: ${e.message}");
  } catch (e) {
    setLoading(false);
    UtilsFunction.showFlushbarMessage(context, Colors.red, "Error: ${e.toString()}");
  }
}

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    setLoading(true);
    if (email.isEmpty || password.isEmpty) {
      return;
    }
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ).then((value){
        SessionController().userId = value.user!.uid.toString();
        setLoading(false);
        UtilsFunction.showFlushbarMessage(context, Colors.green, "SignIn successfully");
        Navigator.pushNamed(context , RouteNames.navigationBar);

      }).onError((error, stackTrace){
        setLoading(false);
        UtilsFunction.showFlushbarMessage(context, Colors.red, "Error");
      });
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'user-not-found') {
        UtilsFunction.showFlushbarMessage(context, Colors.red, "No email found");
      } else if (e.code == 'wrong-password') {
        UtilsFunction.showFlushbarMessage(context, Colors.red, "Wrong Password" );
      } else {
        UtilsFunction.showFlushbarMessage(context, Colors.red, "Error");
      }
    } catch (e) {
      setLoading(false);
      UtilsFunction.showFlushbarMessage(context, Colors.red, "Error");
    }
  }

  Future<void> sendPasswordResetEmail({
    required String email,
    required BuildContext context,
  }) async {
    setLoading(true);
    if (email.isEmpty) {
      UtilsFunction.showFlushbarMessage(context, Colors.red, "Please enter your email" );
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(
          email: email.trim()
      ).then((value){
        setLoading(false);
        UtilsFunction.showFlushbarMessage(context, Colors.red, "Reset password sent!" );
        Navigator.pushNamed(context , RouteNames.login);
      }).onError((error, stackTrace){
        setLoading(false);
        UtilsFunction.showFlushbarMessage(context, Colors.red, "Error" );
      });
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'user-not-found') {
        UtilsFunction.showFlushbarMessage(context, Colors.red, "No email user found" );
      } else {
        UtilsFunction.showFlushbarMessage(context, Colors.red, "Error" );
      }
    } catch (e) {
      setLoading(false);
      UtilsFunction.showFlushbarMessage(context, Colors.red, "Error" );
    }
  }
}