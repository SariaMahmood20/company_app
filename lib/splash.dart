
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/features/auth/data/services/splash_services.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashService().checkLoginStatus(context);
    return Scaffold(
      body: Center(
        child: Text("Splash Screen",
        style: GoogleFonts.roboto(
          fontSize: 30.h,
          fontWeight: FontWeight.w900,
          color: Colors.black,),
        ),
      ),
    );
  }
}