import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class UtilsFunction{
  
  static void showModalSheet(BuildContext context, Widget child){
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return GestureDetector(
          onTap: (){},
          child: child
        );
      }
      );
  }

  Future<DateTime?> pickDate(BuildContext context)async{
    final DateTime _selectedDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context, 
      firstDate: _selectedDate.subtract(const Duration(days: 7)), 
      lastDate: DateTime(2200)
    );
    if(pickedDate != null && pickedDate != _selectedDate){
        return pickedDate;
    }
    return _selectedDate;

  }
}