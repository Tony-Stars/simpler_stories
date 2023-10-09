import 'package:flutter/material.dart';

import '../domain/vote_type.dart';
import '../ui/vote_button.dart';

class VoteButtonsRow extends StatelessWidget {
  final bool visible;
  final ValueSetter<VoteType> vote;

  const VoteButtonsRow({
    super.key,
    required this.visible,
    required this.vote,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 40.0,
      left: 10.0,
      right: 10.0,
      child: Row(
        children: [
          VoteButton(
            onPressed: vote,
            type: VoteType.dislike,
            visible: visible,
          ),
          VoteButton(
            onPressed: vote,
            type: VoteType.like,
            visible: visible,
          ),
        ],
      ),
    );
  }
}
