import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/views/widget/custom_appbar.dart';
import 'package:deutics_attendance_app/features/leaves/widgets/new_application_card.dart';
import 'package:deutics_attendance_app/features/leaves/widgets/application_card.dart';
import 'package:deutics_attendance_app/app/views/widget/navigation_bar.dart';
import 'package:deutics_attendance_app/app/views/widget/my_drawer.dart';


class ApplicationRecordScreen extends StatelessWidget {
  const ApplicationRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: CustomAppbar(title: "APPLICATION"),
      body: SafeArea(child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            const NewApplicationCard(),
            SizedBox(height: 20.h,),
            const ApplicationCard(),
          ],
        )
      )),
      bottomNavigationBar: const MyNavigationBar(),
      drawer: const MyDrawer(),
    );
  }
}