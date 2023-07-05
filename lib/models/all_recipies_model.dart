import 'package:recipe_recommendation_app/models/recipies_info.dart';

part 'all_recipies.g.dart';

class all_recipies {
  final RecipeInfo recipe;

  const all_recipies({required this.recipe});

  factory all_recipies.fromJson(Map<String, dynamic> json) =>
      _$HitFromJson(json);
  Map<String, dynamic> toJson() => _$HitToJson(this);
}
