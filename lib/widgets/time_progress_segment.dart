import 'package:flutter/material.dart';

import 'time_progress_segment_bar.dart';

class TimeProgressSegment extends StatelessWidget {
  final AnimationController animationController;
  final int page;
  final int currentIndex;

  const TimeProgressSegment({
    super.key,
    required this.animationController,
    required this.page,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                TimeProgressSegmentBar(
                  width: double.infinity,
                  color: page < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                page == currentIndex
                    ? AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return TimeProgressSegmentBar(
                            width: constraints.maxWidth *
                                animationController.value,
                            color: Colors.white,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}
