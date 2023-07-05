import 'package:json_annotation/json_annotation.dart';
import 'package:recipe_recommendation_app/models/recipe_model.dart';
import 'package:recipe_recommendation_app/models/recipies_info.dart';

@JsonSerializable()
part 'all_recipies.g.dart';

class Hit {
  final RecipeInfo recipe;

  const Hit({required this.recipe});

  factory Hit.fromJson(Map<String, dynamic> json) => _$HitFromJson(json);
  Map<String, dynamic> toJson() => _$HitToJson(this);
}
