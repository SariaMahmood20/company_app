import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: Column(
            children: [
              Text("Page Not Found!", style: styles.roboto20w400,),
              SizedBox(height: 20.h,),
              Button(
                buttonText: "Return to Home", 
                onPressed: (){}, 
                width: double.infinity)
            ],
          ),
        ),
      ),
    );
  }
}