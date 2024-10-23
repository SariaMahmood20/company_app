import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';



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

  static void showFlushbarMessage(BuildContext context, Color color, String message){
    showFlushbar(
      context: context, 
      flushbar: Flushbar(
        message: message,
        backgroundColor: color,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(15),
      )..show(context)
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