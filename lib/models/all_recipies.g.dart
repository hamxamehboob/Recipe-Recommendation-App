part of 'all_recipies_model.dart';

AllRecipies _$HitFromJson(Map<String, dynamic> json) {
  return AllRecipies(
    recipe: RecipeInfo.fromJson(json['recipe'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HitToJson(AllRecipies instance) => <String, dynamic>{
      'recipe': instance.recipe.toJson(),
    };
