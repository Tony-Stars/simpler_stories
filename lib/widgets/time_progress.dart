import 'package:flutter/material.dart';
import 'package:simpler_stories/domain/story.dart';

import 'time_progress_segment.dart';

class TimeProgress extends StatelessWidget {
  final List<Story> stories;
  final VoidCallback onClose;
  final AnimationController animationController;
  final int page;

  const TimeProgress({
    super.key,
    required this.stories,
    required this.onClose,
    required this.animationController,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).viewPadding.top,
      left: 10.0,
      right: 10.0,
      child: Row(
        children: [
          ...stories.asMap().map((i, e) {
            return MapEntry(
              i,
              TimeProgressSegment(
                animationController: animationController,
                page: i,
                currentIndex: page,
              ),
            );
          }).values,
          IconButton(
            onPressed: onClose,
            icon: const Icon(Icons.close_rounded),
          ),
        ],
      ),
    );
  }
}
