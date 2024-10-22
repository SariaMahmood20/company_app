import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../app/routes/routes_name.dart';
import '../../../../app/utils/utils.dart';

class SignInViewModel extends ChangeNotifier {
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
      // Handle empty fields
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await userCredential.user?.updateProfile(displayName: "$firstName $lastName");
      // Navigate to the next screen
      Navigator.pushNamed(context, RoutesName.navigationBar);
    } on FirebaseAuthException catch (e) {
      // Handle different error cases
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
}
