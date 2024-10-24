
import 'package:deutics_attendance_app/app/utils/date_provider.dart';
import 'package:deutics_attendance_app/features/checkin/presentation/view_models/checkin_view_model.dart';
import 'package:deutics_attendance_app/features/leaves/presentation/view_models/application_view_model.dart';
import 'package:deutics_attendance_app/features/posts/presentation/view_models/post_view_model.dart';
import 'package:deutics_attendance_app/features/user/presentation/view_models/user_view_model.dart';
import 'package:deutics_attendance_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:deutics_attendance_app/app/navigation/route_names.dart';
import 'package:deutics_attendance_app/app/navigation/routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyClM_EGQoFkx1UGxv0wH71YSUOdUowygV8", 
      appId: "1:130731140664:android:4bbb86be857a291ae428cd", 
      messagingSenderId: "130731140664",
      projectId: "deuticsapp")
  );
  FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: true);
   runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 895),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>PostViewModel()),
            ChangeNotifierProvider(create: (_)=>ApplicationViewModel()),
            ChangeNotifierProvider(create: (_)=>CheckinViewModel()),
            ChangeNotifierProvider(create: (_)=>UserViewModel()),
            ChangeNotifierProvider(create: (_)=>DateProvider())
          ],
          child: MaterialApp(
            theme: lightTheme, // Apply the lightTheme here
            initialRoute: RouteNames.navigationBar,
            onGenerateRoute: Routes.generateRoutes,
            // home: Homepage(),
          ),
        );
      },
    );
  }
}