// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipies_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeInfo _$RecipeInfoFromJson(Map<String, dynamic> json) => RecipeInfo(
      uri: json['uri'] as String,
      label: json['label'] as String,
      image: json['image'] as String,
      cuisineType: (json['cuisineType'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mealType:
          (json['mealType'] as List<dynamic>).map((e) => e as String).toList(),
      dishType:
          (json['dishType'] as List<dynamic>).map((e) => e as String).toList(),
      ingredientLines: (json['ingredientLines'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeInfoToJson(RecipeInfo instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'label': instance.label,
      'image': instance.image,
      'ingredientLines': instance.ingredientLines,
      'cuisineType': instance.cuisineType,
      'mealType': instance.mealType,
      'dishType': instance.dishType,
    };
