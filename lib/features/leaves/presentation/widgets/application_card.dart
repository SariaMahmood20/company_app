import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/features/leaves/presentation/widgets/status_widget.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class ApplicationCard extends StatelessWidget {
  const ApplicationCard({super.key});

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
                        "Saria Mahmood",
                        style: styles.roboto16w600
                      ),
                      Text(
                        "Flutter Developer",
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
                      "Application for Sick Leave",
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