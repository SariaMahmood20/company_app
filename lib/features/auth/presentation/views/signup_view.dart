import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/views/widget/app_button.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/headings.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/termcondition_string.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/text_button.dart';
import 'package:deutics_attendance_app/features/auth/presentation/widgets/text_field.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                    'REGISTER',
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 23.sp,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                  CustomTextButton(
                    text: 'SIGN IN',
                    fontSize: 15,
                    textDecoration: TextDecoration.underline,
                    onPressed: (){
                      Navigator.pushNamed(context, RouteNames.login);
                    },
                  ),
                ],
              ),
              40.verticalSpace,
              const CustomTextColumn(
                titleText: 'NEW IN DEUTICS',
                titleFontSize: 16,
                descriptionText: 'Register to speed up',
                descriptionFontSize: 15,
                descriptionColor: Color(0xFF888888),
              ),
              50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: EditTextField(
                      labelText: 'First Name',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                  ),
                  20.horizontalSpace,
                  const Expanded(
                    child: EditTextField(
                      labelText: 'Last Name',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                  ),
                ],
              ),
              5.verticalSpace,
              const EditTextField(
                labelText: 'Designation',
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              5.verticalSpace,
              const EditTextField(
                labelText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
              ),
              5.verticalSpace,
              const EditTextField(
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              15.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                child: const TextString(
                  text: 'By you clicking Register Now, Ypu agree to aur \nTerm & Conditions and Privacy Policy',
                  textFontSize: 14,
                  textColor: Color(0xFF888888)
                ),
              ),
              65.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: AppButton(buttonText: "REGISTER NOW",onPressed: (){
                  Navigator.pushNamed(context, RouteNames.navigationBar);
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
