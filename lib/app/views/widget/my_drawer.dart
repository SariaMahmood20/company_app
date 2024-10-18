import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/app/views/widget/my_divider.dart';
import 'package:deutics_attendance_app/app/navigation/route_names.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(50.w), bottomRight: Radius.circular(50.w))
      ),
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Saria Mahmood", style: styles.roboto16w600,), 
            accountEmail: Text("sariamahmood20@gmail.com", style: styles.roboto8w400,),
            currentAccountPicture: const CircleAvatar(),
            decoration: BoxDecoration(
              color: styles.black
            ),

          ),
          ListTile(
            leading: SvgPicture.asset(
              SvgIcons.settings, 
              color: styles.black,
            ),
            title: Text(
              "Settings", 
              style: styles.roboto16w600,
            ),
            onTap: (){
              Navigator.pushNamed(context, RouteNames.settings);
            },
          ),
          const MyDivider(),
          ListTile(
            leading: SvgPicture.asset(
              SvgIcons.records,
              color: styles.black,  
            ),
            title: Text(
              "Records", 
              style: styles.roboto16w600,
            ),
          ),
          const MyDivider(),
          ListTile(
            leading: SvgPicture.asset(
              SvgIcons.logout,
              color: styles.black,
            ),
            title: Text(
              "Logout", 
              style: styles.roboto16w600,
            ),
          )
        ],
      ),
    );
  }
}