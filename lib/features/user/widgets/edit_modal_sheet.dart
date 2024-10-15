import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:deutics_attendance_app/app/views/widget/button.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';

class EditModalSheet extends StatefulWidget {
  final String editable;
  EditModalSheet({required this.editable,super.key});

  @override
  State<EditModalSheet> createState() => _EditModalSheetState();
}

class _EditModalSheetState extends State<EditModalSheet> {

  final _editingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _editingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _editingController,
            decoration: InputDecoration(
              hintText: widget.editable,
              hintStyle: styles.roboto14w400.copyWith(color: Colors.grey)
            ),
          ),
          SizedBox(height: 45.h,),
          Button(buttonText: "Submit", onPressed: (){}, width: double.infinity)
        ],
      ),
    );
  }
}