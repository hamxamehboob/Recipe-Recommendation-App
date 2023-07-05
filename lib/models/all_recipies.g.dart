part of 'all_recipies_model.dart';

Hit _$HitFromJson(Map<String, dynamic> json) {
  return Hit(
    recipe: RecipeInfo.fromJson(json['recipe'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HitToJson(Hit instance) => <String, dynamic>{
      'recipe': instance.recipe.toJson(),
    };
