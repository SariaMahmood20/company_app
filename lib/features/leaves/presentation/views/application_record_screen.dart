import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/features/leaves/presentation/widgets/new_application_card.dart';
import 'package:deutics_attendance_app/features/leaves/presentation/widgets/application_card.dart';
import 'package:deutics_attendance_app/features/leaves/presentation/view_models/application_view_model.dart';

class ApplicationRecordScreen extends StatelessWidget {

  const ApplicationRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch applications for the user when the screen loads
    final applicationViewModel = Provider.of<ApplicationViewModel>(context, listen: false);
    applicationViewModel.getApplication();


    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            const NewApplicationCard(),
            SizedBox(height: 20.h),
            Expanded(
              child: Consumer<ApplicationViewModel>(
                builder: (context, applicationProvider, child) {
                  if (applicationProvider.errorMessage != null) {
                    return Center(child: Text(applicationProvider.errorMessage!));
                  }

                  if (applicationProvider.applications.isEmpty) {
                    return Center(child: Text("No applications found."));
                  }

                  return ListView.builder(
                    itemCount: applicationProvider.applications.length,
                    itemBuilder: (context, index) {
                      final application = applicationProvider.applications[index];

                      return ApplicationCard(
                        applicationTitle: application.title,
                        userPfp: '', // Use default or user data if available
                        userName: '', // Use default or user data if available
                        designation: '', // Use default or user data if available
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
