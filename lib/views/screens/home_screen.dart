import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/constants/assets.dart';
import 'package:recipe_recommendation_app/views/screens/all_recipies_screen.dart';
import 'package:recipe_recommendation_app/views/widgets/search_bar.dart';
import '../../controllers/home_page_controller.dart';
import '../../models/recipe_model.dart';
import '../widgets/recipe_cart.dart';
import '../widgets/shimmer_effect.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Recipe>> _recipeFuture;
  final HomePageController _homePageLogic = HomePageController();
  bool _showAllRecipes = true;

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  void _fetchRecipes() {
    setState(() {
      _showAllRecipes = true;
      _recipeFuture = _homePageLogic.fetchRecipes();
    });
  }

  void _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _showAllRecipes = false;
        _recipeFuture = _homePageLogic.searchRecipes(query);
      });
    } else {
      _fetchRecipes();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SearchingBar(onSearchSubmitted: _onSearchSubmitted),
              SizedBox(height: size.height * .01),
              Image.asset(homeScreenImage),
              SizedBox(height: size.height * .02),
              Row(
                children: [
                  const Text(
                    'Featured Recipes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AllRecipiesScreen(),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF868889),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * .02),
              FutureBuilder<List<Recipe>>(
                future: _recipeFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: size.height * 1.37,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: size.width / (size.height / 1.8),
                        ),
                        itemBuilder: (context, index) {
                          return const RecipeCartShimmer();
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error occurred: ${snapshot.error}',
                      ),
                    );
                  } else {
                    final recipeList = snapshot.data!;

                    return SizedBox(
                      height: size.height * 1.33,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: size.width / (size.height / 1.87),
                        ),
                        itemCount:
                            _showAllRecipes ? 10 : recipeList[0].hits.length,
                        itemBuilder: (context, index) {
                          if (recipeList.isEmpty ||
                              index >= recipeList[0].hits.length) {
                            return Container();
                          }
                          final recipeName =
                              recipeList[0].hits[index].recipe.label;
                          final cusineName =
                              recipeList[0].hits[index].recipe.cuisineType;
                          final mealType =
                              recipeList[0].hits[index].recipe.mealType;
                          final dishType =
                              recipeList[0].hits[index].recipe.dishType;
                          final ingredient =
                              recipeList[0].hits[index].recipe.ingredientLines;

                          return RecipeCart(
                            lblText: recipeName,
                            lblImage: _showAllRecipes
                                ? recipeList[0].hits[index].recipe.image
                                : recipeList[0].hits[index].recipe.image,
                            recipeName: recipeName.toString(),
                            dishType: dishType.toString(),
                            cusineName: cusineName.toString(),
                            mealType: mealType.toString(),
                            ingredientInfo: ingredient,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
