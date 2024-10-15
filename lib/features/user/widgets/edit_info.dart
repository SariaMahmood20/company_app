import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/constants/svg_icons.dart';
import 'package:deutics_attendance_app/app/utils/utils_function.dart';
import 'package:deutics_attendance_app/features/user/presentation/widgets/edit_modal_sheet.dart';

class EditInfoRow extends StatelessWidget {
  final String text;
  EditInfoRow({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: styles.roboto14w400.copyWith(color: Colors.grey),),
        InkWell(
          onTap: (){
            return UtilsFunction.showModalSheet(context, EditModalSheet(editable: text));
          },
          child: SvgPicture.asset(
            SvgIcons.editImage,
            height: 24.h,
            width: 24.w,
          ),
        )
      ],
    );
  }
}

