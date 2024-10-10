// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
    this.profileAvatarRadius,
    this.profileAvatarIconSize, this.profilePictureUrl,
  });
  final double? profileAvatarRadius;
  final double? profileAvatarIconSize;
  final String? profilePictureUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: profileAvatarRadius,
      backgroundColor: const Color(0xFFC7DAFF),
      backgroundImage: Image.network(profilePictureUrl ?? '').image,
      child: profilePictureUrl == null
          ? Icon(Icons.person, size: profileAvatarIconSize, color: Colors.white)
          : null,
    );
  }
}
