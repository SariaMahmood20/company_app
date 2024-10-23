import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/views/widget/my_app_bar.dart';
import 'package:deutics_attendance_app/app/views/widget/my_drawer.dart';
import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/features/posts/presentation/views/post_screen.dart';
import 'package:deutics_attendance_app/features/checkin/presentation/views/checkin_screen.dart';
import 'package:deutics_attendance_app/features/leaves/presentation/views/application_record_screen.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});


  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> with SingleTickerProviderStateMixin {

  
  int _tabIndex = 0;
  late PageController pageController;



  final List<String> _titles = [
    "POSTS",
    "APPLICATIONS",
    "CHECK-IN",

  ];


  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  void onTabChange(int index) {

    setState(() {
      _tabIndex = index;
    });
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
    ),
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Scaffold(

      appBar: MyAppBar(appBarTitle: _titles[_tabIndex]),
      drawer: MyDrawer(),


      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
        children: const [
          PostScreen(), // Replace with your actual screens

          ApplicationRecordScreen(),

          CheckInScreen(),
          ApplicationRecordScreen(),


          // Add more screens as needed
        ],
      ),
      bottomNavigationBar: CircleNavBar(
        activeIndex: _tabIndex,
        activeIcons: activeIcons,
        inactiveIcons: inactiveIcons,
        color: styles.neutralColor,
        height: 80.h,
        circleWidth: 80.h,
        circleColor: styles.black,
        circleShadowColor: styles.black,
        onTap: (index) {
          // Change tabs and update the PageView
          onTabChange(index);
        },
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        shadowColor: styles.black,
        elevation: 10,
      ),
    );
  }
}
