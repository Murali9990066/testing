import 'package:flutter/material.dart';

class AppDrawerItem {
  final Widget icon;
  final String title;
  final VoidCallback onTap;

  AppDrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}