import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle fontStyler(Color customColor, String customFontWeight, int customFontSize) {
  return GoogleFonts.inter(
    color: customColor,
    fontSize: customFontSize.r,
    fontWeight: (customFontWeight == 'bold')
        ? FontWeight.bold
        : (customFontWeight == 'semi bold')
            ? FontWeight.w700
            : (customFontWeight == 'normal')
                ? FontWeight.normal
                : FontWeight.normal,
  );
}
