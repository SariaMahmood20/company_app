import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/features/checkin/presentation/view_models/checkin_view_model.dart';

class TextCheckRow extends StatelessWidget {
  final bool isCheckIn;
  final bool isCheckout;

  const TextCheckRow(
      {super.key,
      this.isCheckIn = false,
      this.isCheckout = false // Default to check-in
      });

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;
    final viewModel = Provider.of<CheckinViewModel>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Check in", style: styles.roboto16w600),
            viewModel.isCheckedCheckIn
                ? Text(
                    viewModel.checkInTime ?? '',
                    style: styles.roboto16w600.copyWith(color: Colors.green),
                  )
                : Checkbox(
                    value: viewModel.isCheckedCheckIn,
                    onChanged: (value) {
                      viewModel.toggleCheckIn(); // Toggle check-in state
                    },
                  ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Check out", style: styles.roboto16w600),
            viewModel.isCheckedCheckOut
                ? Text(
                    viewModel.checkOutTime ?? '',
                    style: styles.roboto16w600.copyWith(color: Colors.red),
                  )
                : Checkbox(
                    value: viewModel.isCheckedCheckOut,
                    onChanged: (value) {
                      viewModel.toggleCheckOut(); // Toggle check-out state
                    },
                  ),
          ],
        )
      ],
    );
  }
}
