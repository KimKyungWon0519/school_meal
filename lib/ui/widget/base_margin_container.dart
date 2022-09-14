import 'package:flutter/material.dart';

class BaseMarginContainer extends StatelessWidget {
  final Widget child;

  const BaseMarginContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: child,
    );
  }
}
