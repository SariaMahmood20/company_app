import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/views/widget/button.dart';

import '../../../app/views/widget/custom_appbar.dart';

class PasswordSettingScreen extends StatefulWidget {
  const PasswordSettingScreen({super.key});

  @override
  State<PasswordSettingScreen> createState() => _PasswordSettingScreenState();
}

class _PasswordSettingScreenState extends State<PasswordSettingScreen> {
  final _newPassword = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _currentPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _newPassword.dispose();
    _currentPassword.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppbar(title: "PASSWORD SETTINGS"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 65.h,),
              TextFormField(
                controller: _currentPassword,
                decoration: InputDecoration(
                  labelText: "Current Password",
                  labelStyle: styles.roboto14w400,
                  hintText: "Enter Current Password",
                  hintStyle: styles.roboto14w400.copyWith(color: Colors.grey)
                ),
              ),
              SizedBox(height: 65.h,),
              TextFormField(
                controller: _newPassword,
                decoration: InputDecoration(
                  labelText: "New Password",
                  labelStyle: styles.roboto14w400,
                  hintText: "Enter New Password",
                  hintStyle: styles.roboto14w400.copyWith(color: Colors.grey)
                ),
              ),
              SizedBox(height: 30.h,),
              TextFormField(
                controller: _confirmPassword,
                decoration: InputDecoration(
                  labelText: "Confirm New Password",
                  labelStyle: styles.roboto14w400,
                  hintText: "Confirm New Password",
                  hintStyle: styles.roboto14w400.copyWith(color: Colors.grey),
                ),
              ),
              SizedBox(height: 30.h,),
              Text(
                "Changing password will log you out from anywhere you are logged in.",
                style: styles.roboto14w400,
              ),
              SizedBox(height: 65.h,),
              Button(buttonText: "SUBMIT", onPressed: (){}, width: double.infinity),
            ],
          ),
          ),
      ),
    );
  }
}