// Flutter imports:
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/config/config.dart';

class AppTextStyle {
  static const letterSpacing = null;
  static const fontFamily = 'SFPro';

  static TextStyle header1({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 26,
      fontWeight: fontWeight ?? FontWeight.w800,
    );
  }

  static TextStyle header2({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 24,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle header3({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.gray3,
      fontSize: 18,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle header4({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w800,
    );
  }

  static TextStyle header5({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle label2({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 18,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }

  static TextStyle label3({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.gray3,
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w700,
    );
  }

  static TextStyle label4({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.gray3,
      fontSize: 12,
      fontWeight: fontWeight ?? FontWeight.w600,
    );
  }

  static TextStyle body1({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.gray2,
      fontSize: 20,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle body3({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle body4({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 11,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }

  static TextStyle body5({Color? color, FontWeight? fontWeight}) {
    return GoogleFonts.nunito(
      color: color ?? AppColors.black,
      fontSize: 10,
      fontWeight: fontWeight ?? FontWeight.w500,
    );
  }
}
