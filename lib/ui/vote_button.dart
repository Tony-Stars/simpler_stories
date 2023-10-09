import 'package:flutter/material.dart';
import 'package:simpler_stories/domain/vote_type.dart';
import 'package:simpler_stories/utils/duration_constants.dart';

class VoteButton extends StatelessWidget {
  final ValueSetter<VoteType> onPressed;
  final VoteType type;
  final bool visible;

  const VoteButton({
    super.key,
    required this.onPressed,
    required this.type,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: AnimatedOpacity(
          opacity: visible ? 1.0 : 0.0,
          duration: visible ? DurationConstants.show : DurationConstants.hide,
          child: ElevatedButton(
            onPressed: visible ? () => onPressed(type) : null,
            child: Icon(type.icon),
          ),
        ),
      ),
    );
  }
}
