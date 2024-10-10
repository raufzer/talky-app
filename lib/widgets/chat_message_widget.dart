import 'package:flutter/material.dart';
import 'package:talky_app/utils/font_styler.dart';
import 'package:talky_app/widgets/profile_avatar_widget.dart';

class ChatMessage extends StatelessWidget {
  final String senderName;
  final String message;
  final String time;
  final String profilePictureUrl;

  ChatMessage({
    required this.senderName,
    required this.message,
    required this.time,
    required this.profilePictureUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileAvatar(
            profileAvatarIconSize: 20,
            profileAvatarRadius: 26,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(senderName,
                  style: fontStyler(Color(0xFF243443), 'semi bold', 14)),
              SizedBox(height: 3),
              Text(message, style: fontStyler(Color(0xFF58616A), 'normal', 12)),
            ],
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: fontStyler(Color(0xFF58616A), 'normal', 10)),
              SizedBox(height: 5),
              Icon(Icons.arrow_forward_ios_rounded),
            ],
          )
        ],
      ),
    );
  }
}
