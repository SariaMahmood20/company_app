import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class NewPostCard extends StatelessWidget {
  NewPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!; 
    return Column(
      children: [
        Container(
          height: 93.h,
          width: double.infinity,
          child: Card(
            color: styles.lightGrey,
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
                            style: styles.roboto16w600,
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
                      "What's on your mind?",
                      style: styles.roboto16w400.copyWith(color: Colors.grey),
                      ),
                  )
                ],
              ),
            ),
          )
        ),
        SizedBox(height: 6.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Button(
              width: 99,
              buttonText: "DRAFT",
              onPressed: (){},
              ),
            Button(
              width: 99,
              buttonText: "POST",
              onPressed: (){}
              )
          ],
        ),
        SizedBox(height: 35.h,)
      ],
    );
  }
}