import 'package:json_annotation/json_annotation.dart';

import 'all_recipies_model.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  @JsonKey(name: 'q')
  final String query;
  final List<all_recipies> hits;

  const Recipe({
    required this.query,
    required this.hits,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
