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

import 'app/views/widget/navigation_bar.dart';
import 'features/auth/presentation/views/login_view.dart';
import 'features/auth/presentation/views/signin_view.dart';
import 'features/checkin/views/checkin_screen.dart';

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
          home: const HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Theme.of(context).extension<AppTheme>()!;

    return const CheckInScreen();
  }
}
