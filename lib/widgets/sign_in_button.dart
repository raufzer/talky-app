import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_app/utils/constants.dart';

class SignInWithButton extends StatelessWidget {
  const SignInWithButton({
    super.key,
    required this.iconAsset,
    required this.text,
    required this.onPressed,
  });

  final String iconAsset;
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
              color: greyColor.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 38.r),
            SvgPicture.asset(
              iconAsset,
              width: 24,
              height: 24,
            ),
            SizedBox(width: 30.r),
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 13.r,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF243443),
              ),
            ),
            SizedBox(width: 38.r),
          ],
        ),
      ),
    );
  }
}
