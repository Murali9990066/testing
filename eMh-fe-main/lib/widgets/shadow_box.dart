import 'package:e_medfile/theme/color_theme.dart';
import 'package:flutter/material.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({
    this.child,
    this.shape = BoxShape.circle,
    this.padding,
    this.color = AppColors.light,
  });

  final Widget? child;
  final BoxShape shape;
  final EdgeInsets? padding;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        shape: shape,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
