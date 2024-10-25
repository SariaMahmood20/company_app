import 'package:flutter/cupertino.dart';

class SessionController with ChangeNotifier {

  static final SessionController _session = SessionController._internal();

  String? userId;

  factory SessionController(){
    return _session;
  }

  SessionController._internal(){

  }
}