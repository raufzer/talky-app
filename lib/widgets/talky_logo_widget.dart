import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_app/utils/dot.dart';

class TalkyLogo extends StatelessWidget {
  const TalkyLogo({super.key, required this.textColor, required this.dotColor, required this.textSize, required this.dotSize, required this.sizedBoxDot});
  final Color textColor;
  final Color dotColor;
  final double textSize;
  final double dotSize;
  final double sizedBoxDot;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Talky',
          style: GoogleFonts.inter(
            fontSize: textSize.r,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        SizedBox(
          width: 10.r,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: sizedBoxDot.r,
            ),
            Dot(
              color: dotColor,
              size: dotSize.r,
            ),
          ],
        ),
      ],
    );
  }
}
