import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String image;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    @required this.image,
    this.color = Colors.orange,
  });
}
