import 'package:flutter/material.dart';
import 'package:talky_app/utils/colors.dart';
import 'package:talky_app/widgets/app_bar.dart';
import 'package:talky_app/widgets/chat_call_widget.dart';
import 'package:talky_app/widgets/chat_message_widget.dart';

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
            height: 15,
          ),
          AppBarView(),
          const SizedBox(
            height: 24,
          ),
          ChatCallWidget(),
          const SizedBox(
            height: 30,
          ),
          ChatMessage(
            senderName: 'Abd Raouf',
            message: 'Hey, did you talk to her?',
            time: '2min ago',
            profilePictureUrl: 'https://ibb.co/XV5yd0p',
          ),
          ChatMessage(
            senderName: 'Abd Raouf',
            message: 'Hey, did you talk to her?',
            time: '2min ago',
            profilePictureUrl: 'https://ibb.co/XV5yd0p',
          ),
          ChatMessage(
            senderName: 'Abd Raouf',
            message: 'Hey, did you talk to her?',
            time: '2min ago',
            profilePictureUrl: 'https://ibb.co/XV5yd0p',
          ),
          ChatMessage(
            senderName: 'Abd Raouf',
            message: 'Hey, did you talk to her?',
            time: '2min ago',
            profilePictureUrl: 'https://ibb.co/XV5yd0p',
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0,right:20),
        child: FloatingActionButton.large(
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          backgroundColor: Color(0xFF377DFF),
          foregroundColor: Colors.white,
          elevation: 0.0,
          child: Icon(Icons.chat_bubble_outline),
        ),
        
      ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
