import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talky_app/utils/colors.dart';
import 'package:talky_app/utils/font_styler.dart';
import 'package:talky_app/widgets/app_bar_title.dart';

class TalkyAppBar extends StatelessWidget {
  const TalkyAppBar({super.key, required this.appBarTitle});
  final AppBarTitle appBarTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      title: appBarTitle,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15.r),
            SvgPicture.asset(
              'assets/icons/back_icon.svg',
              height: 30.r,
              width: 30.r,
            ),
            SizedBox(width: 5.r),
            Text(
              'Back',
              style: fontStyler(const Color(0xFF377DFF), 'bold', 16),
            ),
          ],
        ),
      ),
    );
  }
}
