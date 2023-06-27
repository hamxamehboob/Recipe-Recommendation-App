part of 'recipe.dart';

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'label': instance.label,
      'image': instance.image,
      'ingredients': instance.ingredients,
      'url': instance.url,
      'dietLabels': instance.dietLabels,
      'cuisineType': instance.cuisineType,
      'mealType': instance.mealType,
      'dishType': instance.dishType,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    label: json['label'] as String,
    image: json['image'] as String,
    ingredients:
        (json['ingredients'] as List<dynamic>).map((e) => e as String).toList(),
    url: json['url'] as String,
    dietLabels: (json['dietLabels'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    cuisineType: (json['cuisineType'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    mealType:
        (json['mealType'] as List<dynamic>?)?.map((e) => e as String).toList(),
    dishType:
        (json['dishType'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}
