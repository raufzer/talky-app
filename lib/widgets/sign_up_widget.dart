import 'package:flutter/material.dart';
import 'package:talky_app/utils/constants.dart';
import 'package:talky_app/widgets/custom_text.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const CustomText(
              customText: "Don't have an account?",
              customColor: Color(0xFF243443),
              customFontWeight: 'medium'),
          GestureDetector(
            onTap: () {},
            child: const CustomText(
                customText: 'Sign up here',
                customColor: blueColor,
                customFontWeight: 'bold'),
          )
        ],
      ),
    );
  }
}
