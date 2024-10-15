import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextColumn extends StatelessWidget {
  final String titleText;
  final double titleFontSize;
  final String descriptionText;
  final double descriptionFontSize;
  final Color descriptionColor;

  const CustomTextColumn({
    Key? key,
    required this.titleText,
    required this.titleFontSize,
    required this.descriptionText,
    required this.descriptionFontSize,
    required this.descriptionColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: GoogleFonts.roboto(
              fontSize: titleFontSize.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            descriptionText,
            style: GoogleFonts.roboto(
              fontSize: descriptionFontSize.sp,
              fontWeight: FontWeight.w400,
              color: descriptionColor,
            ),
          ),
        ],
      ),
    );
  }
}
