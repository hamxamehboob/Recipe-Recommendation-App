part of 'recipe_model.dart';

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe(
    q: json['q'] as String,
    from: json['from'] as int,
    to: json['to'] as int,
    more: json['more'] as bool,
    count: json['count'] as int,
    hits: (json['hits'] as List<dynamic>)
        .map((e) => Hit.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'q': instance.q,
      'from': instance.from,
      'to': instance.to,
      'more': instance.more,
      'count': instance.count,
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
    source: json['source'] as String,
    url: json['url'] as String,
    shareAs: json['shareAs'] as String,
    yield: json['yield'] as int,
    cuisineType:
        (json['cuisineType'] as List<dynamic>).map((e) => e as String).toList(),
    mealType:
        (json['mealType'] as List<dynamic>).map((e) => e as String).toList(),
    dishType:
        (json['dishType'] as List<dynamic>).map((e) => e as String).toList(),
    calories: (json['calories'] as num).toDouble(),
    totalWeight: (json['totalWeight'] as num).toDouble(),
    totalTime: json['totalTime'] as int,
  );
}

Map<String, dynamic> _$RecipeInfoToJson(RecipeInfo instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'label': instance.label,
      'image': instance.image,
      'source': instance.source,
      'url': instance.url,
      'shareAs': instance.shareAs,
      'yield': instance.yield,
      'cuisineType': instance.cuisineType,
      'mealType': instance.mealType,
      'dishType': instance.dishType,
      'calories': instance.calories,
      'totalWeight': instance.totalWeight,
      'totalTime': instance.totalTime,
    };
