part of 'recipe_model.dart';

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    query: json['q'] as String,
    hits: (json['hits'] as List<dynamic>)
        .map((e) => all_recipies.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'q': instance.query,
      'hits': instance.hits.map((e) => e.toJson()).toList(),
    };
