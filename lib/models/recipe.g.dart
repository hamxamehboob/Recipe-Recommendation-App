part of 'recipe_model.dart';

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    q: json['q'] as String,
    hits: (json['hits'] as List<dynamic>)
        .map((e) => Hit.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'q': instance.q,
      'hits': instance.hits.map((e) => e.toJson()).toList(),
    };

Hit _$HitFromJson(Map<String, dynamic> json) {
  return Hit(
    recipe: RecipeInfo.fromJson(json['recipe'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HitToJson(Hit instance) => <String, dynamic>{
      'recipe': instance.recipe.toJson(),
    };

RecipeInfo _$RecipeInfoFromJson(Map<String, dynamic> json) {
  return RecipeInfo(
    uri: json['uri'] as String,
    label: json['label'] as String,
    image: json['image'] as String,
    cuisineType:
        (json['cuisineType'] as List<dynamic>).map((e) => e as String).toList(),
    mealType:
        (json['mealType'] as List<dynamic>).map((e) => e as String).toList(),
    dishType:
        (json['dishType'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$RecipeInfoToJson(RecipeInfo instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'label': instance.label,
      'image': instance.image,
      'cuisineType': instance.cuisineType,
      'mealType': instance.mealType,
      'dishType': instance.dishType,
    };
