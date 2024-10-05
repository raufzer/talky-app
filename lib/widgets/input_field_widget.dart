import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talky_app/utils/constants.dart';

class InputFieldWidget extends StatelessWidget {
   InputFieldWidget(
      {super.key, required this.hintText, this.onChanged});
  Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        validator: (data){
          if (data!.isEmpty) return 'Email address is required';
          if (!data.contains('@')) return 'Invalid email address';
          return null;
        },
        onChanged: onChanged,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 12.r,
            color: const Color(0xFFAAB0B7),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFFAAB0B7),
                width: 1,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: blueColor),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
