import 'package:flutter/material.dart';

class AvailabilityIndicator extends StatefulWidget {
  @override
  _AvailabilityIndicatorState createState() => _AvailabilityIndicatorState();
}

class _AvailabilityIndicatorState extends State<AvailabilityIndicator> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAvailable = !isAvailable;
        });
      },
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 54,
              width: 350,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        isAvailable ? Color(0xFF2DCA8C) : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(isAvailable ? 'Available' : 'Unavailable'),
                  const SizedBox(width: 140),
                  Spacer(),
                  Container(
                    width: 1,
                    height: 44,
                    color: const Color(0xFFAAB0B7),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
