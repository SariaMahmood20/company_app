import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../app/routes/routes_name.dart';
import '../../../../app/utils/utils.dart';
import '../../data/services/session_manager.dart';

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
      return;
    }
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      ).then((value){
        SessionController().userId = value.user!.uid.toString();
        ref.child(value.user!.uid.toString()).set({
          'uid' : value.user!.uid.toString(),
          'name' : "$firstName $lastName",
          'designation' : designation,
          'email' : value.user!.email.toString(),
          'imgUrl' : 'https://www.sefram.com/images/products/photos/hi_res/7202.jpg',
          'about' : 'Hi, I am a Flutter Developer at Deutics Global!',
        }).then((value){
          setLoading(false);
          Utils.toastMessage("User created successfully");
          Navigator.pushNamed(context , RoutesName.login);
        }).onError((error, stackTrace){
          setLoading(false);
          Utils.flushBarErrorMessages("Error: ${error.toString()}", context);
        });
      }).onError((error, stackTrace){
        setLoading(false);
        Utils.flushBarErrorMessages("Error: ${error.toString()}", context);
      });
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'weak-password') {
        Utils.flushBarErrorMessages("The password provided is too weak.", context);
      } else if (e.code == 'email-already-in-use') {
        Utils.flushBarErrorMessages("The account already exists for that email.", context);
      } else {
        Utils.flushBarErrorMessages("Error: ${e.message}", context);
      }
    } catch (e) {
      setLoading(false);
      Utils.flushBarErrorMessages("Error: ${e.toString()}", context);
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
        Utils.toastMessage("SignIn successfully");
        Navigator.pushNamed(context , RoutesName.navigationBar);

      }).onError((error, stackTrace){
        setLoading(false);
        Utils.flushBarErrorMessages("Error: ${error.toString()}", context);
      });
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'user-not-found') {
        Utils.flushBarErrorMessages("No user found for that email.", context);
      } else if (e.code == 'wrong-password') {
        Utils.flushBarErrorMessages("Wrong password provided for that user.", context);
      } else {
        Utils.flushBarErrorMessages("Error: ${e.message}", context);
      }
    } catch (e) {
      setLoading(false);
      Utils.flushBarErrorMessages("Error: ${e.toString()}", context);
    }
  }

  Future<void> sendPasswordResetEmail({
    required String email,
    required BuildContext context,
  }) async {
    setLoading(true);
    if (email.isEmpty) {
      Utils.flushBarErrorMessages("Please enter your email.", context);
      return;
    }
    try {
      await _auth.sendPasswordResetEmail(
          email: email.trim()
      ).then((value){
        setLoading(false);
        Utils.toastMessage("Password reset email has been sent!");
        Navigator.pushNamed(context , RoutesName.login);
      }).onError((error, stackTrace){
        setLoading(false);
        Utils.flushBarErrorMessages("Error: ${error.toString()}", context);
      });
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      if (e.code == 'user-not-found') {
        Utils.flushBarErrorMessages("No user found for that email.", context);
      } else {
        Utils.flushBarErrorMessages("Error: ${e.message}", context);
      }
    } catch (e) {
      setLoading(false);
      Utils.flushBarErrorMessages("Error: ${e.toString()}", context);
    }
  }
}
