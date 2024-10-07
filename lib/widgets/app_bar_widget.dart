import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky_app/utils/font_styler.dart';
import 'package:talky_app/widgets/app_bar_title.dart';

class TalkyAppBar extends StatelessWidget {
  const TalkyAppBar({super.key, required this.appBarTitle});
  final AppBarTitle appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 15.r),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset(
            'assets/icons/back_icon.svg',
            height: 25.r,
            width: 25.r,
          ),
        ),
        SizedBox(width: 5.r),
        Text(
          'Back',
          style: fontStyler(const Color(0xFF377DFF), 'bold', 14),
        ),
        SizedBox(
          width: 70.r,
        ),
        appBarTitle,
      ],
    );
  }
}
