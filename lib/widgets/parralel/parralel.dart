import 'package:flutter/widgets.dart';

class Parralel extends StatelessWidget {
  final Widget w1;
  final Widget w2;
  final MainAxisAlignment? mainAxisAlignment;
  final double? spacing;

  const Parralel({
    super.key,
    this.spacing,
    required this.w1,
    required this.w2,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start, 
    spacing: spacing ?? 10,
    children: [w1, w2]);
  }
}
