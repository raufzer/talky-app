import 'package:flutter/material.dart';
import 'package:talky_app/utils/colors.dart';
import 'package:talky_app/widgets/app_bar_title.dart';
import 'package:talky_app/widgets/app_bar_widget.dart';

class ChatScreen extends StatelessWidget {
   const ChatScreen({super.key});
   static String id = '/ChatScreen';
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
            appBarTitle: AppBarTitle(customText: 'Annette Black'),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}