import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CheckRowWidget extends StatelessWidget {
  const CheckRowWidget({
    super.key,
    required this.text,
    required this.time,
    required this.styles,
  });

  final TextStyle styles;
  final String text;
  final Timestamp time;

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat('h:mm a').format(time.toDate());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: styles,
        ),
        Text(
          formattedTime,
          style: styles,
        ),
      ],
    );
  }
}
