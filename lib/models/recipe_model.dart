import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@immutable
@JsonSerializable()
class Recipe {
  final String label;
  final String image;
  final List<String> ingredients;
  final String url;
  final List<String>? dietLabels;
  final List<String>? cuisineType;
  final List<String>? mealType;
  final List<String>? dishType;

  const Recipe({
    required this.label,
    required this.image,
    required this.ingredients,
    required this.url,
    required this.dietLabels,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
