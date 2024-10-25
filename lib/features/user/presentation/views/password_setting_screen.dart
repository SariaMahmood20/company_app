import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/views/widget/my_app_bar.dart';
import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:deutics_attendance_app/features/user/presentation/view_models/user_view_model.dart';


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
        appBar: MyAppBar(appBarTitle: "Password Settings"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Consumer<UserViewModel>(
            builder: (context, userProvider, child){
              return Column(
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
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter your password";
                    }
                    if(value != userProvider.user!.password){
                      return "Incorrect Password";
                    }
                    return null;
                  }
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
                  validator: (value){
                    if(value == null|| value.isEmpty){
                      return "PLease enter the password";
                    }
                    if(value.length < 6){
                      return "Please enter bigger password";
                    }
                    if(value == userProvider.user!.password){
                      return "This is same as your previous password" ;
                    }
                    return null;
                  },
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
                  validator: (value){

                    if(value == null || value.isEmpty){
                      return "Please confirm your password";
                    }
                    
                    if(value != _newPassword.value){
                      return "Please match your password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30.h,),
                Text(
                  "Changing password will log you out from anywhere you are logged in.",
                  style: styles.roboto14w400,
                ),
                SizedBox(height: 65.h,),
                Button(buttonText: "SUBMIT", onPressed: (){userProvider.updatePassword(_newPassword.text);}, width: double.infinity),
              ],
            );
            },
          ),
          ),
      ),
    );
  }
}