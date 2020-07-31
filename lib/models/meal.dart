import 'package:flutter/foundation.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final Cost cost;
  final Complexity complexity;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

  const Meal({
    this.id,
    this.categories,
    this.title,
    this.cost,
    this.complexity,
    this.imageUrl,
    this.duration,
    this.ingredients,
    this.steps,
    this.isGlutenFree,
    this.isVegan,
    this.isVegetarian,
    this.isLactoseFree,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Medium:
        return 'Normal';
      case Complexity.Difficult:
        return 'Difficult';
      default:
        return 'Unknown';
    }
  }

  String get costText {
    switch (cost) {
      case Cost.Cheap:
        return 'Cheap';
      case Cost.Fair:
        return 'Fair';
      case Cost.Expensive:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }
}

enum Complexity { Simple, Medium, Difficult }

enum Cost { Cheap, Fair, Expensive }
