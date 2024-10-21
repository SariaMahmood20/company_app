import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';

import '../../../app/routes/routes_name.dart';

class NewApplicationCard extends StatelessWidget {
  const NewApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 6.h,
      color: const Color(0xB0EFEFEF),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 25.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Write an application for a new leave.",
              style: styles.roboto14w400,
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.newApplication);
              },
              child: Container(
                height: 41.h,
                width: 41.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: styles.black
                ),
                child: Center(
                  child: SvgPicture.asset(
                    SvgIcons.forwardArrow,
                    color: styles.white,
                    height: 17.5.h,
                    width: 10.w,
                  ),
                ),
              ),
            )
          ],
        ),
        ),
    );
  }
}
