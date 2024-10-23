import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _confirmPassword.dispose();
    _newPassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 65.h,),
              Text("Change your Password", style: styles.roboto16w600),
              SizedBox(height: 40.h,),
              TextFormField(
                controller: _newPassword,
                decoration: InputDecoration(
                  hintText: "Enter New Password",
                  hintStyle: styles.roboto14w600.copyWith(color: Colors.grey)
                ),
              ),
              SizedBox(height: 30.h,),
              TextFormField(
                controller: _confirmPassword,
                decoration: InputDecoration(
                  hintText: "Confirm your passsword",
                  hintStyle: styles.roboto14w600.copyWith(color: Colors.grey)
                )
              ),
              SizedBox(height: 65.h,),
              Button(buttonText: "SUBMIT", onPressed: (){
                Navigator.pushReplacementNamed(context, RouteNames.login);
              }, width: double.infinity)
            ],
          ),
        )
        ),
    );
  }
}