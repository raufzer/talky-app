import 'package:flutter/material.dart';
import 'package:talky_app/utils/colors.dart';
import 'package:talky_app/widgets/app_bar_title.dart';
import 'package:talky_app/widgets/app_bar_widget.dart';
import 'package:talky_app/widgets/custom_button.dart';
import 'package:talky_app/widgets/input_field_widget.dart';
import 'package:talky_app/widgets/profile_avatar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static String id = '/ProfileScreen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? profileName;
  String? profileBio;
  String? profileStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 26,
          ),
          const TalkyAppBar(
            appBarTitle: AppBarTitle(customText: 'Profile'),
          ),
          const SizedBox(
            height: 26,
          ),
          const ProfileAvatar(),
          const SizedBox(height: 38),
          const SizedBox(height: 38),
          InputFieldWidget(
            hintText: 'Enter your profile name',
            onChanged: (data) {
              profileName = data;
            },
            obscureText: false,
          ),
          const SizedBox(height: 18),
          InputFieldWidget(
            hintText: 'Enter your bio',
            onChanged: (data) {
              profileBio = data;
            },
            obscureText: false,
          ),
          const SizedBox(height: 160),
          CustomButton(text: 'Complete', onTap: () {}),
          const SizedBox(height: 32),
          const SizedBox(width: 100),
        ],
      ),
    );
  }
}
