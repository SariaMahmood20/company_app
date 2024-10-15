import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double fontSize;
  final TextDecoration textDecoration;

  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.fontSize, required this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w500,
          decoration: textDecoration,
        ),
      ),
    );
  }
}
