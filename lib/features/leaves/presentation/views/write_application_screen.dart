import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/utils/date_provider.dart';
import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/views/widget/my_app_bar.dart';

class WriteApplicationScreen extends StatelessWidget {

  WriteApplicationScreen({super.key});

  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "Submit Application"),
      body: ChangeNotifierProvider(
        create: (context)=> DateProvider(),
        builder: (context, child){
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: styles.roboto20w600,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none)),
                  maxLines: 1, // Allows for multi-line input
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  "Description",
                  style: styles.roboto20w600,
                ),
                SizedBox(
                  height: 15.h,
                ),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      fillColor: Colors.black12,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide.none)),
                  maxLines: 10,
                ),
                SizedBox(height: 15.h,),
                Consumer<DateProvider>(
                  builder: (context, provider, child){
                    return Row(
                    children: [
                      InkWell(
                        onTap: (){
                          provider.pickDate(context);
                        },
                        child: SvgPicture.asset(
                          SvgIcons.calender,
                          height: 24.h,
                          width: 23.w,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Text( provider.formatDate(provider.leaveDate))
                    ],
                  );
                  
                  },
                ),
                SizedBox(height: 30.h,),
                Button(buttonText: "SUBMIT", onPressed: (){
                  Navigator.pushReplacementNamed(context, RouteNames.navigationBar);
                }, width: double.infinity)
              ],
            ),
          );
        },
      ),
    );
  }
}
