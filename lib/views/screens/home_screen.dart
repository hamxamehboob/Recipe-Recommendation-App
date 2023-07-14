import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_recommendation_app/views/shared_components/shimmer_effect.dart';
import '../../constants/assets.dart';
import '../../providers/recipies_provider.dart';
import '../../providers/search_recipe_provider.dart';
import '../shared_components/recipe_cart.dart';
import '../shared_components/search_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    final recipeScreenProvider = ref.watch(recipesProvider);
    final searchScreenProvider = ref.watch(
      searchRecipesProvider(
        ref.read(searchRecipeKeywordsProvider).toString(),
      ),
    );
    final searchRecipeKeywords =
        ref.read(searchRecipeKeywordsProvider).toString();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: size.height * .02,
              left: size.width * .03,
              right: size.width * .04,
              bottom: size.height * .01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchingBar(
                  onSearchSubmitted: (value) {
                    ref.read(searchRecipeKeywordsProvider.notifier).state =
                        value;
                  },
                ),
                SizedBox(height: size.height * .01),
                Image.asset(homeScreenImage),
                SizedBox(height: size.height * .02),
                Padding(
                  padding: EdgeInsets.only(left: size.width * .01),
                  child: const Text(
                    'Featured Recipes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: size.height * .01),
                searchRecipeKeywords.isNotEmpty
                    ? searchScreenProvider.when(
                        data: (listOfRecipe) => GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / (size.height / 1.82),
                          ),
                          itemCount: listOfRecipe[0].hits.length,
                          itemBuilder: (context, index) {
                            final recipe = listOfRecipe[0].hits[index].recipe;
                            final recipeName = recipe.label;
                            final cuisineName = recipe.cuisineType;
                            final mealType = recipe.mealType;
                            final dishType = recipe.dishType;
                            final ingredient = recipe.ingredientLines;
                            final recipeImage = recipe.image;

                            return RecipeCard(
                              lblText: recipeName,
                              lblImage: recipeImage,
                              dishType: dishType.toString(),
                              mealType: mealType.toString(),
                              ingredientInfo: ingredient,
                              cusineName: cuisineName.toString(),
                            );
                          },
                        ),
                        error: (e, _) => const Text('ERROR'),
                        loading: () =>
                            Center(child: const CircularProgressIndicator()),
                      )
                    : recipeScreenProvider.when(
                        data: (listOfRecipe) => GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / (size.height / 1.82),
                          ),
                          itemCount: listOfRecipe[0].hits.length,
                          itemBuilder: (context, index) {
                            final recipe = listOfRecipe[0].hits[index].recipe;
                            final recipeName = recipe.label;
                            final cuisineName = recipe.cuisineType;
                            final mealType = recipe.mealType;
                            final dishType = recipe.dishType;
                            final ingredient = recipe.ingredientLines;
                            final recipeImage = recipe.image;

                            return RecipeCard(
                              lblText: recipeName,
                              lblImage: recipeImage,
                              dishType: dishType.toString(),
                              cusineName: cuisineName.toString(),
                              mealType: mealType.toString(),
                              ingredientInfo: ingredient,
                            );
                          },
                        ),
                        error: (e, _) => const Text('ERROR'),
                        loading: () => SizedBox(
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  size.width / (size.height / 1.87),
                            ),
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return const RecipeCardShimmer();
                            },
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// _getConnectivity() async {
  //   bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //   setState(() {});

  //   if (!isDeviceConnected) {
  //     // ignore: use_build_context_synchronously
  //     showInternetConnectionDialog(context);
  //   }

  //   _subscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) async {
  //     bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
  //     if (!isDeviceConnected) {
  //       // ignore: use_build_context_synchronously
  //       showInternetConnectionDialog(context);
  //     } else {
  //       setState(() {
  //         _fetchRecipes();
  //       });
  //     }
  //   });
  // }
