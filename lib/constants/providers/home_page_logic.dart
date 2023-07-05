import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/recipe_model.dart';
import '../apis.dart';

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
      print(e);
      return [];
    }
  }

  Future<List<Recipe>> fetchRecipes() async {
    return await _getRecipe();
  }
}
