import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class PostCard extends StatelessWidget {
  final String postContent;
  const PostCard({super.key, required this.postContent});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Container(
      width: double.infinity,
      child: Card(
        color: styles.neutralColor,
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
                child: Text(
                  postContent,
                  style: styles.roboto16w400,
                ),
              )
            ],
          ))));
     
  }
}
