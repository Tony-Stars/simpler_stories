import 'package:flutter/material.dart';

import '../utils/duration_constants.dart';

class StoryImage extends StatelessWidget {
  final bool visible;
  final String image;

  const StoryImage({
    super.key,
    required this.visible,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 120.0,
      left: 10.0,
      right: 10.0,
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: visible ? DurationConstants.show : DurationConstants.hide,
        child: Image.asset(
          image,
          width: double.infinity,
        ),
      ),
    );
  }
}
