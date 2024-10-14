// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:talky_app/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:talky_app/cubits/sign_in_cubit/sign_in_states.dart';

import 'package:talky_app/services/auth_methods.dart';
import 'package:talky_app/utils/auth_error_handling_messages.dart';
import 'package:talky_app/utils/show_snack_bar.dart';
import 'package:talky_app/utils/validators.dart';
import 'package:talky_app/widgets/app_bar_title.dart';
import 'package:talky_app/widgets/app_bar_widget.dart';
import 'package:talky_app/widgets/custom_button.dart';
import 'package:talky_app/widgets/custom_title_widget.dart';
import 'package:talky_app/widgets/forgot_password_button.dart';
import 'package:talky_app/widgets/input_field_widget.dart';
import 'package:talky_app/widgets/sign_up_widget.dart';
import 'package:talky_app/widgets/talky_logo_widget.dart';

class SignInScreen extends StatelessWidget {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  static String id = '/SignInScreen';

  SignInScreen({
    super.key,
    this.email,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          isLoading = true;
        } else if (state is SignInSuccess) {
          isLoading = false;
          Navigator.pushNamed(
            context,
            '/ChatScreen',
          );
        } else if (state is SignInFailure) {
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 26),
                const TalkyAppBar(appBarTitle: AppBarTitle(customText: '')),
                const SizedBox(height: 26),
                const TalkyLogo(
                  textColor: Color(0xFF243443),
                  dotColor: Color(0xFF377DFF),
                  textSize: 45,
                  dotSize: 15,
                  sizedBoxDot: 40,
                ),
                const SizedBox(height: 38),
                const Center(
                  child: CustomTitleWidget(
                    titleText: 'Hello, Welcome back!',
                    titleSize: 16,
                    titleColor: Color(0xFF243443),
                    titleWeight: 'semi bold',
                  ),
                ),
                const SizedBox(height: 38),
                InputFieldWidget(
                  hintText: 'Enter your email address',
                  validator: emailValidator,
                  onChanged: (data) {
                    email = data;
                  },
                  obscureText: false,
                ),
                const SizedBox(height: 18),
                InputFieldWidget(
                  hintText: 'Enter your password',
                  validator: passwordValidator,
                  onChanged: (data) {
                    password = data;
                  },
                  obscureText: true,
                ),
                ForgotPasswordButton(onPressed: () {}),
                const SizedBox(height: 160),
                CustomButton(
                  text: 'Sign in',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      // context.read<SignInCubit>().signInMethod(
                      //       email: email!,
                      //       password: password!,
                      //     );
                      BlocProvider.of<SignInCubit>(context).signInMethod(
                        email: email!,
                        password: password!,
                      );
                    }
                  },
                ),
                const SizedBox(height: 32),
                const SignUpWidget(),
                const SizedBox(width: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
