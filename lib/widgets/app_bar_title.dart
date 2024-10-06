import 'package:flutter/material.dart'
    show BuildContext, Color, StatelessWidget, Text, Widget;
import 'package:talky_app/utils/font_styler.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.customText,
  });

  final String customText;

  @override
  Widget build(BuildContext context) {
    return Text(
      customText,
      style: fontStyler(const Color(0xFF243443), 'bold', 16),
    );
  }
}
