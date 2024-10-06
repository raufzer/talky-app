import 'package:flutter/material.dart';
import 'package:talky_app/widgets/sign_in_button.dart';

class SignInWithWidget extends StatelessWidget {
  const SignInWithWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SignInWithButton(
          iconAsset: 'assets/icons/google_logo.svg',
          text: 'Sign in with Google',
          onPressed: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        SignInWithButton(
          iconAsset: 'assets/icons/facebook_logo.svg',
          text: 'Sign in with Facebook',
          onPressed: () {},
        ),
        const SizedBox(
          height: 16,
        ),
        SignInWithButton(iconAsset: 'assets/icons/apple_logo.svg', text: 'Sign in with Apple', onPressed: (){})
      ],
    );
  }
}
