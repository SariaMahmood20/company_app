import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app/views/widget/custom_appbar.dart';
import '../../../app/views/widget/my_app_bar.dart';
import '../../../app/views/widget/my_drawer.dart';
import '../../../app/views/widget/navigation_bar.dart';
import 'package:google_fonts/google_fonts.dart';


class CheckInScreen extends StatelessWidget {
  const CheckInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      appBar: const CustomAppbar(title: 'CHECK-IN',),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: const Column(
          children: [
            Center(child: Text("12345"))
          ],
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
