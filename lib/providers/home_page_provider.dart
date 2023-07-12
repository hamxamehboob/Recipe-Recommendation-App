import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/home_page_controller.dart';
import '../models/recipe_model.dart';

final homePageControllerProvider =
    Provider<HomePageController>((ref) => HomePageController());

final recipesProvider = FutureProvider<List<Recipe>>((ref) {
  final homePageController = ref.watch(homePageControllerProvider);
  return homePageController.fetchRecipes();
});

final searchRecipesProvider =
    FutureProvider.family<List<Recipe>, String>((ref, query) {
  final homePageController = ref.watch(homePageControllerProvider);
  return homePageController.searchRecipes(query);
});
