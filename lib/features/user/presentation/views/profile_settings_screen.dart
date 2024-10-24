import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';


import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/features/user/presentation/widgets/edit_info.dart';
import 'package:deutics_attendance_app/features/user/presentation/widgets/change_profile_picture.dart';
import 'package:deutics_attendance_app/app/views/widget/my_app_bar.dart';
import 'package:deutics_attendance_app/features/user/data/models/user_model.dart';
import 'package:deutics_attendance_app/features/user/presentation/view_models/user_view_model.dart';

class ProfileSettingsScreen extends StatelessWidget {

  ProfileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      appBar: MyAppBar(appBarTitle: "Profile Settings"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Consumer<UserViewModel>(
          builder: (context, userProvider, child){
            return  Column(
            children: [
              const ChangeProfilePicture(imgUrl: "imgUrl"),
              SizedBox(height: 25.h,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Name", style: styles.roboto14w600),
                  SizedBox(height: 28.h,),
                  Text(userProvider.user!.firstName+" "+userProvider.user!.lastName, style: styles.roboto14w400.copyWith(color: Colors.grey),),
                  SizedBox(height: 15.h,),
                  const Divider(),
                  SizedBox(height: 15.h,),
                  Text("Designation", style: styles.roboto14w600),
                  SizedBox(height: 28.h,),
                  EditInfoRow(text: userProvider.user!.designation),
                  SizedBox(height: 15.h,),
                  const Divider(),
                  SizedBox(height: 15.h,),
                  Text("Email", style: styles.roboto14w600),
                  SizedBox(height: 28.h,),
                  Text(userProvider.user!.email, style: styles.roboto14w400.copyWith(color: Colors.grey),),
                  SizedBox(height: 15.h,),
                  const Divider(),
                  SizedBox(height: 15.h,),
                  Text("About Us", style: styles.roboto14w600),
                  SizedBox(height: 28.h,),
                  EditInfoRow(text: "Hi, I am a Flutter Developer at Deutics Global!"),
                  SizedBox(height: 15.h,),
                  const Divider(),
                ],
              )
            ],
          );
          },
        ),
      ),
    );
  }
}