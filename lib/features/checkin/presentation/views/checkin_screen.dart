
import 'package:deutics_attendance_app/features/checkin/presentation/widgets/checkin_widget.dart';
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
    // Fetch applications for the user when the screen loads
    final checkinViewModel = Provider.of<CheckinViewModel>(context, listen: false);
    checkinViewModel.getCheckinRecords();


    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            NewCheckinWidget(
              date: Timestamp.now(),
              designation: "Flutter Developer",
              text: "Checkin",
              userName: "Saria Mahmood",
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: Consumer<CheckinViewModel>(
                builder: (context, checkinProvider, child) {

                  if (checkinProvider.checkinRecords.isEmpty) {
                    return const Center(child: Text("No applications found."));
                  }

                  return ListView.builder(
                    itemCount: checkinProvider.checkinRecords.length,
                    itemBuilder: (context, index) {

                      return CheckInWidget(
                        checkinTime: checkinProvider.checkinRecords[index].checkIn,
                        checkoutTIme: checkinViewModel.checkinRecords[index].checkOut,
                        
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
