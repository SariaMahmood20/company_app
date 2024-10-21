import 'package:deutics_attendance_app/features/checkin/widgets/checkin_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/views/widget/custom_appbar.dart';
import '../../../app/views/widget/my_drawer.dart';
import '../../../app/views/widget/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/new_checkin_widget.dart';


class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              const NewCheckInWidget(),
              SizedBox(height: 30.h,),
              const CheckInWidget(),
              SizedBox(height: 15.h,),
              const CheckInWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
