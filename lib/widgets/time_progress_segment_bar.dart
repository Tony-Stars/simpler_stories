import 'package:flutter/material.dart';

class TimeProgressSegmentBar extends StatelessWidget {
  final double width;
  final Color color;

  const TimeProgressSegmentBar({
    super.key,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.0,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.black26,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(3.0),
        ),
      ),
    );
  }
}
