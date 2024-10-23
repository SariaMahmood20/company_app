import 'package:deutics_attendance_app/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class SplashView extends StatelessWidget {
  SplashView({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SplashService().checkLoginStatus(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Splash Screen",
            style: GoogleFonts.roboto(
              fontSize: 30.h,
              fontWeight: FontWeight.w900,
              color: Colors.black, // Constant title color
            ),
            ),
            Text("USER: ${_auth.currentUser!.displayName}"),
          ],
        ),
      ),
    );
  }
}
