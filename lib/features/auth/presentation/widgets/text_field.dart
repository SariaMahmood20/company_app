import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/utils.dart';

class EditTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String labelText;
  final TextEditingController? controller;
  final FocusNode? currentFocusNode;
  final FocusNode? nextFocusNode;

  const EditTextField({
    super.key,
    required this.labelText,
    required this.keyboardType,
    required this.obscureText,
    this.controller,
    this.currentFocusNode,
    this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      focusNode: currentFocusNode,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.roboto(fontSize: 15.sp, color: const Color(0xFF888888)),
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        alignLabelWithHint: true,
      ),

      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          Utils.fieldFocusChange(context, currentFocusNode!, nextFocusNode!);
        }
      },
    );
  }
}
