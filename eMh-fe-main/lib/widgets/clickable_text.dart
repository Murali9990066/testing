import 'package:flutter/material.dart';

class ClickableText extends Text {
  final VoidCallback onPressed;

  const ClickableText(
    super.text, {super.key, 
    super.style,
    super.textAlign,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: super.build(context),
    );
  }
}
