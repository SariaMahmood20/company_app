import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final bool loading;
  const AppButton({super.key, required this.buttonText, this.onPressed, required this.loading,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        backgroundColor: Colors.black,
      ),
      child: loading ? const Center(child: CircularProgressIndicator()) : Text(
        buttonText,
        style: GoogleFonts.roboto(
            color: Colors.white,
            fontWeight: FontWeight.w500
        ),
      ),
    );
    // return GestureDetector(
    //   onTap: onPressed,
    //   child: Container(
    //     width: width.w,
    //     height: height.h,
    //     decoration: BoxDecoration(
    //         color: Colors.black,
    //         borderRadius: BorderRadius.circular(55)
    //     ),
    //     child: Center(
    //       child: Text(
    //         buttonText,
    //         style: GoogleFonts.roboto(
    //             color: Colors.white,
    //             fontWeight: FontWeight.w500
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}