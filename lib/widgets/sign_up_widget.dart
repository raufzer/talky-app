import 'package:flutter/material.dart';
import 'package:talky_app/utils/colors.dart';
import 'package:talky_app/widgets/custom_text.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
            customText: "Don't have an account?",
            customColor: Color(0xFF243443),
            customFontWeight: 'medium'),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/SignUpScreen');
          },
          child: const CustomText(
              customText: 'Sign up here',
              customColor: blueColor,
              customFontWeight: 'bold'),
        )
      ],
    );
  }
}
