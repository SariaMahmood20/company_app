import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 140.h, bottom: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'SIGN IN',
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('REGISTER',
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline
                    ),
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HAVE AN ACCOUNT?',
                    style: GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w400)
                  ),
                  Text(
                    'Sign in to speed up the checkout \nprocess',
                    style: GoogleFonts.roboto(fontSize: 15.sp, fontWeight: FontWeight.w400, color: const Color(0xFF888888)),
                  ),
                ]
              ),
            ),
            50.verticalSpace,
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: GoogleFonts.roboto(fontSize: 15.sp, color: const Color(0xFF888888)),
                contentPadding: const EdgeInsets.symmetric(vertical: 1),
                alignLabelWithHint: true
              ),
            ),
            15.verticalSpace,
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.roboto(fontSize: 15.sp, color: const Color(0xFF888888)),
                  contentPadding: const EdgeInsets.symmetric(vertical: 1),
                  alignLabelWithHint: true,
              ),
            ),
            10.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                },
                child: Text('FORGOT PASSWORD?',
                style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline
                ),
                ),
              ),
            ),
            70.verticalSpace,
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                backgroundColor: Colors.black,
              ),
              child: Text(
                'SIGN IN',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
