import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';


import 'check_row_widget.dart';

class CheckInWidget extends StatelessWidget {
  const CheckInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xDDF8F8F8),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 5),
          ),
        ],
      ),
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
                    Text("Saria Mahmood", style: styles.roboto16w600),
                    Text(
                      "Flutter Developer",
                      style: styles.roboto8w400,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w,),
              child: Card(
                elevation: 1,
                color: const Color(0xB0EFEFEF),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: const Column(
                    children: [
                      CheckRowWidget(text: "CHECK IN",time: "9:00 AM",),
                      Divider(),
                      CheckRowWidget(text: "CHECK IN",time: "9:00 AM",)
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
