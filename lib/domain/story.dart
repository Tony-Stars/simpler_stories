import 'package:flutter/material.dart';

class Story {
  final String title;
  final Color background;
  final String image;
  final bool votable;
  final String? caption;

  Story({
    required this.title,
    required this.background,
    required this.image,
    this.votable = true,
    this.caption,
  });
}
