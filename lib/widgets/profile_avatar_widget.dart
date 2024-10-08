// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({
    super.key,
    this.profileAvatarRadius,
  });
  final double? profileAvatarRadius;
  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.profileAvatarRadius,
      backgroundColor: const Color(0xFFC7DAFF),
      backgroundImage: _image != null ? FileImage(File(_image!.path)) : null,
      child: _image == null
          ? const Icon(Icons.person, size: 30, color: Colors.white)
          : null,
    );
  }
}
