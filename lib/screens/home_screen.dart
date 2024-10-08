import 'package:flutter/material.dart';
import 'package:talky_app/utils/colors.dart';
import 'package:talky_app/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: ListView(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          AppBarView(),
        ],
      ),
    );
  }
}
