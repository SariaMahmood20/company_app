import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/app/views/widget/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deutics_attendance_app/app/views/widget/custom_appbar.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/views/widget/my_drawer.dart';
import 'package:deutics_attendance_app/app/views/widget/navigation_bar.dart';
import 'package:deutics_attendance_app/app/utils/date_provider.dart';

import '../../../app/views/widget/button.dart';

class WriteApplicationScreen extends StatelessWidget {
  WriteApplicationScreen({super.key});

  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return ChangeNotifierProvider(
      create: (context) => DateProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: const CustomAppbar(title: "APPLICATION"),
          drawer: const MyDrawer(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: styles.roboto20w600,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "Subject",
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.black12,
                    filled: true,
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2), // Change color and width as needed
                    ),
                  ),
                  maxLines: 1, // Allows for multi-line input
                ),
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  "Description",
                  style: styles.roboto20w600,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: "Application context...",
                    alignLabelWithHint: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: Colors.black12,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                          color: Colors.black12,
                          width: 2), // Change color and width as needed
                    ),
                  ),
                  maxLines: 10,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Consumer<DateProvider>(
                  builder: (context, provider, child) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            provider.pickDate(context);
                          },
                          child: SvgPicture.asset(
                            SvgIcons.calender,
                            height: 24.h,
                            width: 23.w,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(provider.formatDate(provider.leaveDate))
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                Align(
                  alignment: Alignment.center ,
                    child: Button(buttonText: 'Submit', onPressed: () {  }, width: 370.w,)),
              ],
            ),
          ),
        );
      },
    );
  }
}
