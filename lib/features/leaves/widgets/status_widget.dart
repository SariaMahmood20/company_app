import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.black12,
      ),
      height: 53.h,
      width: 200.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Status",
            style: styles.roboto12w400,
          ),
          VerticalDivider(),
          Text(
            "Rejected",
            style: styles.roboto12w400,
            )
        ],
      ),
    );
  }
}