import 'package:flutter/material.dart';


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
}