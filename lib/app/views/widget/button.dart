import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final double width;
  Button({super.key, required this.buttonText, required this.onPressed, required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: 45.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50)
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white
            ),
            // textAlign: TextAlign.center,
                
          ),
        ),
      ),
    );
  }
}