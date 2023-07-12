import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../app_config/api_confiq.dart';
import '../models/recipe_model.dart';

class HomePageController {
  Future<List<Recipe>> _getRecipes(String url) async {
    try {
      var uri = Uri.parse(url);
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
    return _getRecipes(APIConfig.url);
  }

  Future<List<Recipe>> searchRecipes(String query) async {
    String url =
        'https://api.edamam.com/search?q=$query&app_id=${APIConfig.appId}&app_key=${APIConfig.appKey}&to=20';
    return _getRecipes(url);
  }
}

final homePageProvider =
    Provider<HomePageController>((ref) => HomePageController());
