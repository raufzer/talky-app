import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_app/utils/constants.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10.r,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Forgot password?',
            style: GoogleFonts.inter(
                fontSize: 10.r,
                color: blackColor,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
