import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  String q;
  List<Hit> hits;

  Recipe({
    required this.q,
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
  List<String> cuisineType;
  List<String> mealType;
  List<String> dishType;

  RecipeInfo({
    required this.uri,
    required this.label,
    required this.image,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });

  factory RecipeInfo.fromJson(Map<String, dynamic> json) =>
      _$RecipeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeInfoToJson(this);
}
