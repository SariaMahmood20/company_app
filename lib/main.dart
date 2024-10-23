import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:deutics_attendance_app/app/routes/routes_name.dart';
import 'package:deutics_attendance_app/app/routes/routes.dart';
import 'package:deutics_attendance_app/features/auth/presentation/view_models/auth_view_model.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD3FNQckH8TZMxPXBfrI2DAQegSXaduhWA",
        appId: "1:205631315331:android:fb7bdac48a8e32ad6b2ab6",
        messagingSenderId: "205631315331",
        projectId:"company-app-482cd")
  );
   runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 895),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme, // Apply the lightTheme here
            onGenerateRoute: Routes.generateRoute,
            initialRoute: RoutesName.login,
          );
        },
      ),
    );

  }
}