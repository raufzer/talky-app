import 'package:flutter/material.dart';
import 'package:talky_app/widgets/custom_button.dart';
import 'package:talky_app/widgets/custom_title_widget.dart';
import 'package:talky_app/widgets/forgot_password_button.dart';
import 'package:talky_app/widgets/input_field_widget.dart';
import 'package:talky_app/widgets/sign_up_widget.dart';
import 'package:talky_app/widgets/talky_logo_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String id = '/SignInScreen';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email;
  String? password;
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
              height: 38,
            ),
            const Center(
              child: CustomTitleWidget(
                  titleText: 'Sign in',
                  titleSize: 16,
                  titleColor: Color(0xFF243443),
                  titleWeight: 'semi bold'),
            ),
            const SizedBox(
              height: 38,
            ),
            InputFieldWidget(
                onChanged: (data){
                  email = data;
                } ,
                hintText: 'Enter your gmail address'),
            const SizedBox(
              height: 18,
            ),
            InputFieldWidget(
                onChanged: (data){
                  password = data; 
                },
                hintText: 'Enter your password'),
            ForgotPasswordButton(
              onPressed: () {},
            ),
            const SizedBox(
              height: 160,
            ),
            CustomButton(
                text: 'Sign in',
                onTap: () {
                }),
            const SizedBox(
              height: 32,
            ),
            const SignUpWidget(),
            const SizedBox(
              width: 100,
            ),
          ],
        ));
  }
}
