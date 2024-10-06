import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_app/utils/colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.r,
      child: Row(
        children: [
          Expanded(child: Container(height: 1, color: const Color(0xFF58616A))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('or',
                  style: GoogleFonts.inter(
                    color: greyColor,
                    fontSize: 14.r,
                    fontWeight: FontWeight.w500,
                  ))),
          Expanded(child: Container(height: 1, color: const Color(0xFF58616A))),
        ],
      ),
    );
  }
}
