import 'package:recipe_recommendation_app/models/recipies_info.dart';

part 'all_recipies.g.dart';

class AllRecipies {
  final RecipeInfo recipe;

  const AllRecipies({required this.recipe});

  factory AllRecipies.fromJson(Map<String, dynamic> json) =>
      _$HitFromJson(json);
  Map<String, dynamic> toJson() => _$HitToJson(this);
}
