import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class CheckRowWidget extends StatelessWidget {

  const CheckRowWidget({super.key, required this.text, required this.time});
  final String text;
  final String time;
  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: GoogleFonts.roboto(
                fontSize: 13.h,
                fontWeight: FontWeight.w500)),
        Text(time,
            style: GoogleFonts.roboto(
                fontSize: 13.h,
                fontWeight: FontWeight.w500)),
      ],
    );
  }
}
