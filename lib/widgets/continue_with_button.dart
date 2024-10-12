import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_app/utils/colors.dart';

class ContinueWithButton extends StatelessWidget {
  const ContinueWithButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.r,
        width: 316.r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: primaryColor,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 30.r),
            Center(
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 12.r,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
            ),
            SizedBox(width: 30.r),
          ],
        ),
      ),
    );
  }
}
