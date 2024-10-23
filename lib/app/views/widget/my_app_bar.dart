import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget implements PreferredSize{
  final String appBarTitle;
  MyAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(35)
        )
      ),
      elevation: 6.h,
      centerTitle: true,
      title: Text(appBarTitle, style: styles.roboto25w700,),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(56.h);
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}