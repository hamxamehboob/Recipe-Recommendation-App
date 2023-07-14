import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/recipe_model.dart';
import 'home_page_provider.dart';

final searchRecipesProvider =
    FutureProvider.autoDispose.family<List<Recipe>, String>((ref, query) {
  return ref.watch(homePageControllerProvider).searchRecipes(query);
});
final searchRecipeKeywordsProvider = StateProvider<String>((ref) => '');
