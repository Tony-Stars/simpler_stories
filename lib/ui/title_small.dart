import 'package:flutter/material.dart';

class TitleSmall extends StatelessWidget {
  final String data;

  const TitleSmall(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.titleSmall);
  }
}
