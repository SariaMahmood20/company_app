import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:deutics_attendance_app/features/leaves/presentation/widgets/new_application_card.dart';
import 'package:deutics_attendance_app/features/leaves/presentation/widgets/application_card.dart';


class ApplicationRecordScreen extends StatelessWidget {
  const ApplicationRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  SafeArea(child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            const NewApplicationCard(),
            SizedBox(height: 20.h,),
            const ApplicationCard(),
          ],
        )
      ));
  }
}