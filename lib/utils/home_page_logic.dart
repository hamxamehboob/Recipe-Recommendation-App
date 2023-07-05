import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_confiq.dart';
import '../models/recipe_model.dart';

class HomePageLogic {
  Future<List<Recipe>> _getRecipe() async {
    try {
      var uri = Uri.parse(APIConfig.url);
      var response = await http.get(uri);
      var responseString = response.body;
      Map<String, dynamic> parsedJson = jsonDecode(responseString);
      List<Recipe> recipes = [Recipe.fromJson(parsedJson)];
      return recipes;
    } catch (e) {
      return [];
    }
  }

  Future<List<Recipe>> fetchRecipes() async {
    return await _getRecipe();
  }
}
