
// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:talky_app/widgets/profile_avatar_widget.dart';

class ProfileAvatarPicker extends StatefulWidget {
  const ProfileAvatarPicker({super.key});

  @override
  State<ProfileAvatarPicker> createState() => _ProfileAvatarPickerState();
}

class _ProfileAvatarPickerState extends State<ProfileAvatarPicker> {
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Center(
        child: Stack(
          children: [
            ProfileAvatar(profileAvatarRadius: 90),
            Positioned(
              bottom: 5.0,
              right: 5.0,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF377DFF),
                ),
                padding: const EdgeInsets.all(4.0),
                child: const Icon(
                  color: Colors.white,
                  Icons.edit,
                  size: 20.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
