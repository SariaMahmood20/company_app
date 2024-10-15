import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String labelText;
  const EditTextField({super.key, required this.labelText, required this.keyboardType, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: GoogleFonts.roboto(fontSize: 15.sp, color: const Color(0xFF888888)),
          contentPadding: const EdgeInsets.symmetric(vertical: 1),
          alignLabelWithHint: true
      ),
    );
  }
}
