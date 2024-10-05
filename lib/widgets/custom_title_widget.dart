import 'package:flutter/material.dart';
import 'package:talky_app/utils/font_styler.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({
    super.key,
    required this.titleText,
    required this.titleSize,
    required this.titleColor,
    required this.titleWeight,
  });
  final String titleText;
  final int titleSize;
  final Color titleColor;
  final String titleWeight;
  @override
  Widget build(BuildContext context) {
    return Text(titleText,
        style: fontStyler(titleColor, titleWeight, titleSize));
  }
}
