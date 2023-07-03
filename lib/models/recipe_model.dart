import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  String q;
  int from;
  int to;
  bool more;
  int count;
  List<Hit> hits;

  Recipe({
    required this.q,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

@JsonSerializable()
class Hit {
  RecipeInfo recipe;

  Hit({required this.recipe});

  factory Hit.fromJson(Map<String, dynamic> json) => _$HitFromJson(json);
  Map<String, dynamic> toJson() => _$HitToJson(this);
}

@JsonSerializable()
class RecipeInfo {
  String uri;
  String label;
  String image;
  String source;
  String url;
  String shareAs;
  int yield;
  List<String> cuisineType;
  List<String> mealType;
  List<String> dishType;
  double calories;
  double totalWeight;
  int totalTime;

  RecipeInfo({
    required this.uri,
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.yield,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
  });

  factory RecipeInfo.fromJson(Map<String, dynamic> json) =>
      _$RecipeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeInfoToJson(this);
}
