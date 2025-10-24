import 'package:flutter/material.dart';

class LinkModel {
  final String title;
  final String url;
  final String description;
  final String category;
  final IconData icon; // ✅ IconData
  final Color color;

  LinkModel({
    required this.title,
    required this.url,
    required this.description,
    required this.category,
    required this.icon,
    required this.color,
  });
}
