import 'package:flutter/material.dart';

class HeadlineMedium extends StatelessWidget {
  final String data;

  const HeadlineMedium(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(data, style: Theme.of(context).textTheme.headlineMedium);
  }
}
