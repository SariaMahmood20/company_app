import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  // Roboto - w400
  final TextStyle roboto8w400;
  final TextStyle roboto12w400;
  final TextStyle roboto14w400;
  final TextStyle roboto16w400;
  final TextStyle roboto20w400; // Added roboto20w400

  // Roboto - w500
  final TextStyle roboto12w500;

  // Roboto - w600
  final TextStyle roboto14w600;
  final TextStyle roboto16w600; // Added roboto16w600
  final TextStyle roboto20w600; // Added roboto20w600

  // Roboto - w700
  final TextStyle roboto12w700;
  final TextStyle roboto16w700;

  // Colors
  final Color white;
  final Color black;
  final Color lightGrey;

  const AppTheme({
    // Roboto
    required this.roboto8w400,
    required this.roboto12w400,
    required this.roboto14w400,
    required this.roboto16w400,
    required this.roboto20w400, // Added roboto20w400
    required this.roboto12w500,
    required this.roboto14w600,
    required this.roboto16w600, // Added roboto16w600
    required this.roboto20w600, // Added roboto20w600
    required this.roboto12w700,
    required this.roboto16w700,
    // Colors
    required this.white,
    required this.black,
    required this.lightGrey,
  });

  @override
  ThemeExtension<AppTheme> lerp(
      covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      // Roboto
      roboto8w400: TextStyle.lerp(roboto8w400, other.roboto8w400, t)!,
      roboto12w400: TextStyle.lerp(roboto12w400, other.roboto12w400, t)!,
      roboto14w400: TextStyle.lerp(roboto14w400, other.roboto14w400, t)!,
      roboto16w400: TextStyle.lerp(roboto16w400, other.roboto16w400, t)!,
      roboto20w400: TextStyle.lerp(roboto20w400, other.roboto20w400, t)!, // Added interpolation for roboto20w400
      roboto12w500: TextStyle.lerp(roboto12w500, other.roboto12w500, t)!,
      roboto14w600: TextStyle.lerp(roboto14w600, other.roboto14w600, t)!,
      roboto16w600: TextStyle.lerp(roboto16w600, other.roboto16w600, t)!, // Added interpolation for roboto16w600
      roboto20w600: TextStyle.lerp(roboto20w600, other.roboto20w600, t)!, // Added interpolation for roboto20w600
      roboto12w700: TextStyle.lerp(roboto12w700, other.roboto12w700, t)!,
      roboto16w700: TextStyle.lerp(roboto16w700, other.roboto16w700, t)!,
      // Colors
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      lightGrey: Color.lerp(lightGrey, other.lightGrey, t)!,
    );
  }

  static final light = AppTheme(
    // Roboto
    roboto8w400: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 8.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    roboto12w400: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    roboto14w400: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    roboto16w400: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    roboto20w400: TextStyle( // Added roboto20w400 style
      fontFamily: 'Roboto',
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    roboto12w500: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    roboto14w600: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    roboto16w600: TextStyle( // Added roboto16w600 style
      fontFamily: 'Roboto',
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    roboto20w600: TextStyle( // Added roboto20w600 style
      fontFamily: 'Roboto',
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    roboto12w700: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    roboto16w700: TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    // Colors
    white: Colors.white,
    black: Colors.black,
    lightGrey: const Color(0xFFF8F8F8),
  );

  AppTheme copyWith({
    // Roboto
    TextStyle? roboto8w400,
    TextStyle? roboto12w400,
    TextStyle? roboto14w400,
    TextStyle? roboto16w400,
    TextStyle? roboto20w400, // Added roboto20w400 to copyWith
    TextStyle? roboto12w500,
    TextStyle? roboto14w600,
    TextStyle? roboto16w600, // Added roboto16w600 to copyWith
    TextStyle? roboto20w600, // Added roboto20w600 to copyWith
    TextStyle? roboto12w700,
    TextStyle? roboto16w700,
    // Colors
    Color? white,
    Color? black,
    Color? lightGrey,
  }) {
    return AppTheme(
      // Roboto
      roboto8w400: roboto8w400 ?? this.roboto8w400,
      roboto12w400: roboto12w400 ?? this.roboto12w400,
      roboto14w400: roboto14w400 ?? this.roboto14w400,
      roboto16w400: roboto16w400 ?? this.roboto16w400,
      roboto20w400: roboto20w400 ?? this.roboto20w400, // Added roboto20w400 to copyWith
      roboto12w500: roboto12w500 ?? this.roboto12w500,
      roboto14w600: roboto14w600 ?? this.roboto14w600,
      roboto16w600: roboto16w600 ?? this.roboto16w600, // Added roboto16w600 to copyWith
      roboto20w600: roboto20w600 ?? this.roboto20w600, // Added roboto20w600 to copyWith
      roboto12w700: roboto12w700 ?? this.roboto12w700,
      roboto16w700: roboto16w700 ?? this.roboto16w700,
      // Colors
      white: white ?? this.white,
      black: black ?? this.black,
      lightGrey: lightGrey ?? this.lightGrey,
    );
  }
}

// light theme example with AppTheme extension
ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color(0xffF2F2F2),
  splashColor: Colors.transparent,
  canvasColor: Colors.transparent,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: AppTheme.light.roboto16w700,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  ),
  extensions: <ThemeExtension<dynamic>>[
    AppTheme.light,
  ],
);
