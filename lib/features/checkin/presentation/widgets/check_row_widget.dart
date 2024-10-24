import 'package:flutter/cupertino.dart';


class CheckRowWidget extends StatelessWidget {

  const CheckRowWidget({super.key, required this.text, required this.time, required this.styles});
  final TextStyle styles;
  final String text;
  final String time;
  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: styles),
        Text(time,
            style: styles),
      ],
    );
  }
}
