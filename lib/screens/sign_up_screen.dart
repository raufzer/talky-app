// utils.dart
// ignore_for_file: use_build_context_synchronously, avoid_print, unused_local_variable
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:talky_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:talky_app/cubits/auth_cubit/auth_state.dart';
import 'package:talky_app/services/auth_methods.dart';
import 'package:talky_app/utils/auth_error_handling_messages.dart';
import 'package:talky_app/utils/show_snack_bar.dart';
import 'package:talky_app/utils/validators.dart';
import 'package:talky_app/widgets/app_bar_title.dart';
import 'package:talky_app/widgets/app_bar_widget.dart';
import 'package:talky_app/widgets/custom_button.dart';
import 'package:talky_app/widgets/custom_title_widget.dart';
import 'package:talky_app/widgets/input_field_widget.dart';
import 'package:talky_app/widgets/sign_in_widget.dart';
import 'package:talky_app/widgets/talky_logo_widget.dart';

import '../blocs/auth_bloc/auth_bloc.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  String? email;
  String? password;
  bool isLoading = false;
  static String id = '/SignUpScreen';
  GlobalKey<FormState> formKey = GlobalKey();

  SignUpScreen({
    super.key,
    this.email,
    this.password,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          isLoading = true;
        } else if (state is SignUpSuccess) {
          isLoading = false;
          Navigator.pushNamed(
            context,
            '/ProfileScreen',
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
                const SizedBox(
                  height: 26,
                ),
                const TalkyAppBar(
                  appBarTitle: AppBarTitle(customText: ''),
                ),
                const SizedBox(
                  height: 26,
                ),
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
                    titleText: 'Create Account',
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
                const SizedBox(height: 18),
                const SizedBox(height: 160),
                CustomButton(
                  text: 'Continue',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      if (formKey.currentState!.validate()) {
                        // context.read<SignInCubit>().signInMethod(
                        //       email: email!,
                        //       password: password!,
                        //     );
                        BlocProvider.of<AuthBloc>(context).add(SignUpEvent(email: email!, password: password!));
                      }
                    }
                  },
                ),
                const SizedBox(height: 32),
                const SignInWidget(),
                const SizedBox(width: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
