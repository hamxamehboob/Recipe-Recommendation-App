import 'package:recipe_recommendation_app/models/recipies_info.dart';

part 'all_recipies.g.dart';

class Hit {
  final RecipeInfo recipe;

  const Hit({required this.recipe});

  factory Hit.fromJson(Map<String, dynamic> json) => _$HitFromJson(json);
  Map<String, dynamic> toJson() => _$HitToJson(this);
}
