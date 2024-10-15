import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/features/posts/presentation/views/post_screen.dart';


class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});
  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar>  with SingleTickerProviderStateMixin{

  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v){
    _tabIndex = v;
    setState(() {
      
    });
  }

  final activeIcons = [
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: SvgPicture.asset(
        SvgIcons.home,
        color: Colors.white,
        height: 24.h,
        width: 24.w,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: SvgPicture.asset(
        SvgIcons.checkIn,
        color: Colors.white,
        height: 24.h,
        width: 24.w,
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: SvgPicture.asset(
        SvgIcons.submit,
        color: Colors.white,
        height: 24.h,
        width: 24.w,
      ),
    )
  ];

  final inactiveIcons = [
    SvgPicture.asset(
      SvgIcons.home,
      color: Colors.black,
      height: 24.h,
      width: 24.w,
    ),
    SvgPicture.asset(
      SvgIcons.checkIn,
      color: Colors.black,
      height: 24.h,
      width: 24.w,
    ),
    SvgPicture.asset(
      SvgIcons.submit,
      color: Colors.black,
      height: 24.h,
      width: 24.w,
    )
  ];

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }
  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return CircleNavBar(
      activeIndex: tabIndex, 
      activeIcons: activeIcons, 
      inactiveIcons: inactiveIcons, 
      color: styles.neutralColor,
      height: 80.h,
      circleWidth: 80.h,
      circleColor: styles.black,
      circleShadowColor: styles.black,
      
      onTap: (index){
        tabIndex = index;
        pageController.jumpToPage(tabIndex);
      },
      // padding: EdgeInsets.symmetric(horizontal: 15.w,),
      cornerRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      shadowColor: styles.black,
      elevation: 5,

    );
  }
}