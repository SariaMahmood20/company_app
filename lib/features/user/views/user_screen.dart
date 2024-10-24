import 'package:deutics_attendance_app/features/auth/data/services/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/constants/svg_icons.dart';

import '../../../app/routes/routes_name.dart';
import '../widgets/image_widget.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  static Widget divider = const Divider();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
          child: Column(
            children: [
              SizedBox(height: 40.h,),
              const ImageWidget(imageUrl: 'https://www.sefram.com/images/products/photos/hi_res/7202.jpg',),
              SizedBox(height: 20.h,),
              Text("Saria Mahmood", style: styles.roboto16w600,),
              Text("Flutter Developer", style: styles.roboto8w400,),
              SizedBox(height: 70.h,),
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.setting);
                },
                leading: SvgPicture.asset(
                  SvgIcons.settings,
                  width: 31.5.w,
                  height: 32.h,
                  color: styles.black,
                ),
                title: Text("Profile Settings", style: styles.roboto16w600,),
              ),
              divider,
              ListTile(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.changePassword);
                },
                leading: SvgPicture.asset(
                  SvgIcons.password,
                  width: 32.w,
                  height: 32.h,
                  color: styles.black,
                ),
                title: Text("Password", style: styles.roboto16w600,),
              ),
              divider,
              GestureDetector(
                onTap: (){
                  _auth.signOut();
                  SessionController().userId = '';
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: ListTile(
                  leading: SvgPicture.asset(
                    SvgIcons.logout,
                    height: 32.h,
                    width: 32.w,
                    color: styles.black,
                  ),
                  title: Text("Logout", style: styles.roboto16w600,),
                ),
              ),
              divider
            ],
          ),
          )
        ),
    );
  }
}