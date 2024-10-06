import 'package:flutter/material.dart';
import 'package:talky_app/utils/colors.dart';
import 'package:talky_app/widgets/custom_text.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
            customText: "Already have an account?",
            customColor: Color(0xFF243443),
            customFontWeight: 'medium'),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/SignInScreen');
          },
          child: const CustomText(
              customText: 'Sign in here',
              customColor: blueColor,
              customFontWeight: 'bold'),
        )
      ],
    );
  }
}
