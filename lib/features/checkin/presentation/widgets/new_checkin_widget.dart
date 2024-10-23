import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/features/checkin/presentation/widgets/text_check_row.dart';
import 'package:deutics_attendance_app/features/checkin/presentation/view_models/checkin_view_model.dart';

class NewCheckinWidget extends StatelessWidget {
  final String? text;
  final Timestamp? date;
  // final VoidCallbackAction onCheck;
  const NewCheckinWidget({super.key, required this.date, required this.text});

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
                      height: 15.h,
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Column(children: [
                          // Use the TextCheckRow widget here
                          TextCheckRow(
                          ),
                        ]))
                  ],
                ))));
  }
}
