import 'package:flutter/material.dart';
import 'package:talky_app/widgets/continue_with_button.dart';
import 'package:talky_app/widgets/or_divider.dart';
import 'package:talky_app/widgets/sign_in_with_widget.dart';
import 'package:talky_app/widgets/sign_up_widget.dart';
import 'package:talky_app/widgets/talky_logo_widget.dart';

class SignInSocialScreen extends StatefulWidget {
  const SignInSocialScreen({super.key});
  static String id = '/SignInSocialScreen';

  @override
  State<SignInSocialScreen> createState() => _SignInSocialScreenState();
}

class _SignInSocialScreenState extends State<SignInSocialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const TalkyLogo(
              textColor: Color(0xFF243443),
              dotColor: Color(0xFF377DFF),
              textSize: 45,
              dotSize: 15,
              sizedBoxDot: 40,
            ),
            const SizedBox(
              height: 78,
            ),
            const SignInWithWidget(),
            const SizedBox(height: 38),
            const OrDivider(),
            const SizedBox(height: 38),
            ContinueWithButton(
                text: 'Continue with phone number', onPressed: () {}),
            const SizedBox(
              height: 50,
            ),
            const SignUpWidget(),
            const SizedBox(
              height: 100,
            )
          ],
        ));
  }
}
