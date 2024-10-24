import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/features/leaves/presentation/widgets/status_widget.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/features/leaves/data/models/application_model.dart';
import 'package:deutics_attendance_app/features/user/data/models/user_model.dart';

class ApplicationCard extends StatelessWidget {
  final String applicationTitle;
  final String userPfp;
  final String userName;
  final String designation;
  const ApplicationCard({super.key, required this.applicationTitle, required this.userPfp, required this.designation, required this.userName });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Container(
      // width: double.infinity,
      child: Card(
        color: styles.neutralColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        elevation: 6.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: styles.roboto16w600
                      ),
                      Text(
                        designation,
                        style: styles.roboto8w400,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 15.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Text(
                      applicationTitle,
                      style: styles.roboto16w400,
                    ),
                    SizedBox(height: 20.h,),
                    const StatusWidget(),
                    SizedBox(height: 25.h,)
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}