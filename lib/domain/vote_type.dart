import 'package:flutter/material.dart';

enum VoteType {
  like,
  dislike;

  IconData get icon {
    switch (this) {
      case VoteType.dislike:
        return Icons.thumb_down_alt_rounded;
      case VoteType.like:
        return Icons.thumb_up_alt_rounded;
    }
  }
}
