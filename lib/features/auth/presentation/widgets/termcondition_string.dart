import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextString extends StatelessWidget {
  final String text;
  final double textFontSize;
  final Color textColor;

  const TextString(
      {super.key,
      required this.text,
      required this.textFontSize,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontSize: textFontSize.sp,
        fontWeight: FontWeight.w400,
        color: textColor,
      ),
    );
  }
}
