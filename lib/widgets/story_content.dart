import 'package:flutter/material.dart';
import 'package:simpler_stories/domain/story.dart';

import '../ui/headline_medium.dart';
import '../ui/title_small.dart';
import '../utils/duration_constants.dart';

class StoryContent extends StatelessWidget {
  final bool visible;
  final Story story;

  const StoryContent({
    super.key,
    required this.visible,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 120.0,
      left: 10.0,
      right: 10.0,
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: visible ? DurationConstants.show : DurationConstants.hide,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: HeadlineMedium(story.title),
              ),
              const SizedBox(height: 10),
              if (story.caption != null) TitleSmall(story.caption!),
            ],
          ),
        ),
      ),
    );
  }
}
