import 'package:deutics_attendance_app/app/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/app/views/widget/my_divider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Drawer(
      shadowColor: Colors.black,
      width: 280.w,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.w),
          bottomRight: Radius.circular(50.w),
        ),
      ),
      child: Container(
        color: Colors.black12,
        child: ListView(
          children: [
            SizedBox(
              height: 50.h,
            ),
            UserAccountsDrawerHeader(
              onDetailsPressed: (){
                  Navigator.pushNamed(context, RoutesName.userProfile);
              },
              accountName: Text("Saria Mahmood",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 14.sp
                )
              ),
              accountEmail: Text("sariamahmood20@gmail.com",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 14.sp
                  )
              ),
              currentAccountPicture: const CircleAvatar(),
              decoration: const BoxDecoration(
                color: Color(0xDDF8F8F8)
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.setting);
              },
              leading: SvgPicture.asset(
                SvgIcons.settings,
                color: styles.black,
              ),
              title: Text(
                "Settings",
                style: styles.roboto16w600,
              ),
            ),
            const MyDivider(),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.setting);
              },
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
      ),
    );
  }
}