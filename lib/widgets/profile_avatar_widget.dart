import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileAvatar extends StatefulWidget {
  const ProfileAvatar({super.key});

  @override
  State<ProfileAvatar> createState() => _ProfileAvatarState();
}

class _ProfileAvatarState extends State<ProfileAvatar> {
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
            CircleAvatar(
              radius: 90.0,
              backgroundColor: const Color(0xFFC7DAFF),
              backgroundImage:
                  _image != null ? FileImage(File(_image!.path)) : null,
              child: _image == null
                  ? const Icon(Icons.person, size: 150, color: Colors.white)
                  : null,
            ),
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
