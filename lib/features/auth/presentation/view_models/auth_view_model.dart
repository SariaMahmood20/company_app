import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../app/routes/routes_name.dart';
import '../../../../app/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String designation,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      print("user added");
      await userCredential.user?.updateProfile(displayName: "$firstName $lastName");
      Navigator.pushNamed(context , RoutesName.login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.flushBarErrorMessages("The password provided is too weak.", context);
      } else if (e.code == 'email-already-in-use') {
        Utils.flushBarErrorMessages("The account already exists for that email.", context);
      } else {
        Utils.flushBarErrorMessages("Error: ${e.message}", context);
      }
    } catch (e) {
      Utils.flushBarErrorMessages("Error: ${e.toString()}", context);
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return;
    }
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      Fluttertoast.showToast(
        msg: "Sign in successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      print("User logged in");

      Navigator.pushNamed(context, RoutesName.navigationBar);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.flushBarErrorMessages("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        Utils.flushBarErrorMessages("Wrong password provided for that user.", context);
      } else {
        Utils.flushBarErrorMessages("Error: ${e.message}", context);
      }
    } catch (e) {
      Utils.flushBarErrorMessages("Error: ${e.toString()}", context);
    }
  }

  Future<void> sendPasswordResetEmail({
    required String email,
    required BuildContext context,
  }) async {
    if (email.isEmpty) {
      Utils.flushBarErrorMessages("Please enter your email.", context);
      return;
    }

    try {
      await _auth.sendPasswordResetEmail(email: email.trim());

      Fluttertoast.showToast(
        msg: "Password reset email has been sent!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Utils.flushBarErrorMessages("No user found for that email.", context);
      } else {
        Utils.flushBarErrorMessages("Error: ${e.message}", context);
      }
    } catch (e) {
      Utils.flushBarErrorMessages("Error: ${e.toString()}", context);
    }
  }



}
