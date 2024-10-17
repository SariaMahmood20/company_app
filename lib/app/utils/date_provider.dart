import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateProvider with ChangeNotifier{

  String formatDate(DateTime date){
    return DateFormat('MM/dd/yyyy').format(date);
  }

  DateTime leaveDate = DateTime.now();
  Future<void> pickDate(BuildContext context)async{
    final DateTime? pickedDate = await showDatePicker(
      context: context, 
      firstDate: leaveDate.subtract(const Duration(days: 7)), 
      lastDate: DateTime(2200)
    );
    if(pickedDate != null && pickedDate != leaveDate){
        leaveDate = pickedDate;
        notifyListeners();
    }
    notifyListeners();
  }
}