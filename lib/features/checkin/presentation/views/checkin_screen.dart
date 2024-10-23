
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:deutics_attendance_app/features/checkin/presentation/widgets/new_checkin_widget.dart';
import 'package:deutics_attendance_app/features/checkin/presentation/view_models/checkin_view_model.dart';


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
              ChangeNotifierProvider<CheckinViewModel>(
                create: (contxt)=>CheckinViewModel(employeeId: '1'),
                child: Consumer<CheckinViewModel>(
                  builder: (context, checkinProvider, child){
                    return NewCheckinWidget(
                  date: Timestamp.now(), 
                  text: "Check-in"
                  );
                  }
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
