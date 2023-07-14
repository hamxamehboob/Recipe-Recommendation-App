import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/recipe_model.dart';
import 'home_page_provider.dart';

final recipesProvider = FutureProvider<List<Recipe>>((ref) {
  return ref.watch(homePageControllerProvider).fetchRecipes();
});
