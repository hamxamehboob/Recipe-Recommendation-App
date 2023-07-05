part of 'all_recipies_model.dart';

all_recipies _$HitFromJson(Map<String, dynamic> json) {
  return all_recipies(
    recipe: RecipeInfo.fromJson(json['recipe'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HitToJson(all_recipies instance) => <String, dynamic>{
      'recipe': instance.recipe.toJson(),
    };
