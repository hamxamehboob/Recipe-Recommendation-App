import 'package:json_annotation/json_annotation.dart';
part 'recipies_info.g.dart';

@JsonSerializable()
class RecipeInfo {
  final String uri;
  final String label;
  String image;
  List<String> cuisineType;
  List<String> mealType;
  List<String> dishType;

  RecipeInfo({
    required this.uri,
    required this.label,
    required this.image,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
  });

  factory RecipeInfo.fromJson(Map<String, dynamic> json) =>
      _$RecipeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$RecipeInfoToJson(this);
}
