import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CheckButtonRow extends StatefulWidget {
  final String text;
  const CheckButtonRow({super.key, required this.text});

  @override
  State<CheckButtonRow> createState() => _CheckButtonRowState();
}

class _CheckButtonRowState extends State<CheckButtonRow> {
  bool light0 = true;

  final WidgetStateProperty<Icon?> thumbIcon =
  WidgetStateProperty.resolveWith<Icon?>(
        (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text,
            style: GoogleFonts.roboto(
                fontSize: 13.h, fontWeight: FontWeight.w500)),
        Switch(
          activeTrackColor: Colors.green,
          value: light0,
          onChanged: (bool value) {
            setState(() {
              light0 = value;
            });
          },
        )
      ],
    );
  }
}