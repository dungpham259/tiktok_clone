import 'package:flutter/material.dart';

class DisabledWidget extends StatelessWidget {
  final bool disabled;
  final Widget child;

  const DisabledWidget({
    Key? key,
    this.disabled = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!disabled) {
      return child;
    }

    return IgnorePointer(
      child: Opacity(
        opacity: 0.5,
        child: child,
      ),
    );
  }
}
