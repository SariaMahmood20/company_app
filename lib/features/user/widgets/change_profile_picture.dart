import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/constants/svg_icons.dart';

class ChangeProfilePicture extends StatelessWidget {
  final String imgUrl;
  const ChangeProfilePicture({required this.imgUrl,super.key});



  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return InkWell(
      onTap: (){},
      child: badges.Badge(
        badgeStyle: const badges.BadgeStyle(badgeColor: Colors.transparent),
        position: badges.BadgePosition.bottomEnd(bottom: -7, end: -10),
          showBadge: true,
          badgeContent: Container(
            height: 44.h,
            width: 44.w,
            decoration:const BoxDecoration(
              color: Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            child: Center(
              child: SvgPicture.asset(
                SvgIcons.editImage,
                height: 24.h,
                width: 24.w,
                color: styles.black,
              ),
            ),
          ),
        child: InkWell(
          onTap: (){},
          child: CircleAvatar(
            radius: 57.w,
            backgroundColor: styles.black,
            foregroundImage: NetworkImage(imgUrl, ),
          ),
        ),
      ),
    );
  }
}
