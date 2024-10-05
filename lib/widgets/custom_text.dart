import 'package:flutter/material.dart'
    show BuildContext, Color, StatelessWidget, Text, Widget;
import 'package:talky_app/utils/font_styler.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.customText,
    required this.customColor,
    required this.customFontWeight,
  });

  final String customText;
  final Color customColor;
  final String customFontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      style: fontStyler(customColor, customFontWeight, 10),
    );
  }
}
