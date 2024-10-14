import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar extends StatelessWidget implements PreferredSize{
  final String appBarTitle;
  MyAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(35)
        )
      ),
      elevation: 6.h,
      centerTitle: true,
      title: Text(appBarTitle),
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(56.h);
  
  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}