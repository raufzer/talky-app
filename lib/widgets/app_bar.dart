import 'package:flutter/material.dart';
import 'package:talky_app/widgets/profile_avatar_widget.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 20),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            ProfileAvatar(profileAvatarRadius: 24),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Color(0xFF2DCA8C),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
        Spacer(),
        GestureDetector(child: Icon(Icons.search, size: 24)),
        const SizedBox(width: 20),
      ],
    );
  }
}
