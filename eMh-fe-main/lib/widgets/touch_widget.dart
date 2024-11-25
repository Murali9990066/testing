import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';

class TouchWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? splashColor;
  final Color? highlightColor;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  const TouchWidget({
    required this.child,
    this.onTap,
    this.splashColor,
    this.highlightColor,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor,
        highlightColor: highlightColor,
        borderRadius: borderRadius,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}