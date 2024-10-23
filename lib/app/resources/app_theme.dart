import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme extends ThemeExtension<AppTheme> {
  // SF Pro Display (will be updated to Roboto)
  final TextStyle roboto8w400;
  final TextStyle roboto12w400;
  final TextStyle roboto14w400;
  final TextStyle roboto16w400;
  final TextStyle roboto20w400;

  final TextStyle roboto12w500;

  final TextStyle roboto14w600;
  final TextStyle roboto16w600;
  final TextStyle roboto20w600;
  final TextStyle roboto25w700;

  final TextStyle roboto14w700;
  final TextStyle roboto12w700;
  final TextStyle roboto16w700;

  // Colors
  final Color white;
  final Color black;
  final Color neutralColor; // Updated from orangeColor to neutralColor

  const AppTheme({
    required this.roboto8w400,
    required this.roboto12w400,
    required this.roboto14w400,
    required this.roboto16w400,
    required this.roboto20w400,
    required this.roboto12w500,
    required this.roboto14w600,
    required this.roboto14w700,
    required this.roboto16w600,
    required this.roboto20w600,
    required this.roboto25w700,
    required this.roboto12w700,
    required this.roboto16w700,
    required this.white,
    required this.black,
    required this.neutralColor, // Updated color variable
  });

  @override
  ThemeExtension<AppTheme> lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      roboto8w400: TextStyle.lerp(roboto8w400, other.roboto8w400, t)!,
      roboto12w400: TextStyle.lerp(roboto12w400, other.roboto12w400, t)!,
      roboto14w400: TextStyle.lerp(roboto14w400, other.roboto14w400, t)!,
      roboto16w400: TextStyle.lerp(roboto16w400, other.roboto16w400, t)!,
      roboto20w400: TextStyle.lerp(roboto20w400, other.roboto20w400, t)!,
      roboto12w500: TextStyle.lerp(roboto12w500, other.roboto12w500, t)!,
      roboto14w600: TextStyle.lerp(roboto14w600, other.roboto14w600, t)!,
      roboto14w700: TextStyle.lerp(roboto14w700, other.roboto14w700, t)!,
      roboto16w600: TextStyle.lerp(roboto16w600, other.roboto16w600, t)!,
      roboto20w600: TextStyle.lerp(roboto20w600, other.roboto20w600, t)!,
      roboto25w700: TextStyle.lerp(roboto25w700, other.roboto25w700, t)!,
      roboto12w700: TextStyle.lerp(roboto12w700, other.roboto12w700, t)!,
      roboto16w700: TextStyle.lerp(roboto16w700, other.roboto16w700, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      neutralColor: Color.lerp(neutralColor, other.neutralColor, t)!, // Updated color interpolation
    );
  }

  static final light = AppTheme(
    // Roboto Display
    roboto8w400: GoogleFonts.roboto(fontSize: 8.sp, fontWeight: FontWeight.w400),
    roboto12w400:  GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w400),
    roboto14w400:  GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w400),
    roboto16w400:  GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w400),
    roboto20w400:  GoogleFonts.roboto(fontSize: 20.sp, fontWeight: FontWeight.w400),
    roboto12w500:  GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w500),
    roboto14w600:  GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w600),
    roboto14w700:  GoogleFonts.roboto(fontSize: 14.sp, fontWeight: FontWeight.w700),
    roboto16w600:  GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w600),
    roboto20w600:  GoogleFonts.roboto(fontSize: 20.sp, fontWeight: FontWeight.w600),
    roboto25w700:  GoogleFonts.roboto(fontSize: 25.sp, fontWeight: FontWeight.w700),
    roboto12w700:  GoogleFonts.roboto(fontSize: 12.sp, fontWeight: FontWeight.w700),
    roboto16w700:  GoogleFonts.roboto(fontSize: 16.sp, fontWeight: FontWeight.w700),
    // Colors
    white: Colors.white,
    black: Colors.black,
    neutralColor: const Color(0xFFF8F8F8), // Updated to neutral color
  );

  AppTheme copyWith({
    TextStyle? roboto8w400,
    TextStyle? roboto12w400,
    TextStyle? roboto14w400,
    TextStyle? roboto16w400,
    TextStyle? roboto20w400,
    TextStyle? roboto12w500,
    TextStyle? roboto14w600,
    TextStyle? roboto14w700,
    TextStyle? roboto16w600,
    TextStyle? roboto20w600,
    TextStyle? roboto25w700,
    TextStyle? roboto12w700,
    TextStyle? roboto16w700,
    Color? white,
    Color? black,
    Color? neutralColor, // Updated color
  }) {
    return AppTheme(
      roboto8w400: roboto8w400 ?? this.roboto8w400,
      roboto12w400: roboto12w400 ?? this.roboto12w400,
      roboto14w400: roboto14w400 ?? this.roboto14w400,
      roboto16w400: roboto16w400 ?? this.roboto16w400,
      roboto20w400: roboto20w400 ?? this.roboto20w400,
      roboto12w500: roboto12w500 ?? this.roboto12w500,
      roboto14w600: roboto14w600 ?? this.roboto14w600,
      roboto14w700: roboto14w700 ?? this.roboto14w700,
      roboto16w600: roboto16w600 ?? this.roboto16w600,
      roboto20w600: roboto20w600 ?? this.roboto20w600,
      roboto25w700: roboto25w700 ?? this.roboto25w700,
      roboto12w700: roboto12w700 ?? this.roboto12w700,
      roboto16w700: roboto16w700 ?? this.roboto16w700,
      white: white ?? this.white,
      black: black ?? this.black,
      neutralColor: neutralColor ?? this.neutralColor, // Updated color
    );
  }
}

// Updated light theme with Roboto font and new color
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
