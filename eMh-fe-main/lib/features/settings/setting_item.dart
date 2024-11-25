
import 'package:flutter/material.dart';

class SettingItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SettingItem({required this.title, required this.icon, required this.onTap});
}
