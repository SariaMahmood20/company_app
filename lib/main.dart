// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import 'package:deutics_attendance_app/features/posts/presentation/views/post_screen.dart';
// import 'package:deutics_attendance_app/app/resources/app_theme.dart';
// import 'package:google_fonts/google_fonts.dart';
// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(393, 895),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child){
//         final styles = Theme.of(context).extension<AppTheme>()!;
//         return MaterialApp(
//           home: Scaffold(body: Center(child: Text("Hello World", style: GoogleFonts.roboto(),),),),
//         );
//       }
//     );
//   }
// }
import 'package:deutics_attendance_app/features/posts/presentation/views/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deutics_attendance_app/app/resources/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:deutics_attendance_app/features/user/presentation/views/user_screen.dart';
import 'package:deutics_attendance_app/features/user/presentation/views/profile_settings_screen.dart';
import 'package:deutics_attendance_app/features/user/presentation/views/password_setting_screen.dart';

void main() {
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
        return MaterialApp(
          theme: lightTheme, // Apply the lightTheme here
          home:const  PasswordSettingScreen(),
        );
      },
    );
  }
}
