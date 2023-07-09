import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/constants/assets.dart';
import 'package:recipe_recommendation_app/views/screens/all_recipies_screen.dart';
import 'package:recipe_recommendation_app/views/widgets/search_bar.dart';
import '../../controllers/home_page_controller.dart';
import '../../models/recipe_model.dart';
import '../widgets/recipe_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Recipe>> _recipeFuture;
  final HomePageController _homePageLogic = HomePageController();

  @override
  void initState() {
    super.initState();
    _recipeFuture = _homePageLogic.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Column(
              children: [
                const SearchingBar(),
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
                      return const LinearProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final recipeList = snapshot.data!;
                      return SizedBox(
                        height: size.height * 1.35,
                        child: GridView.builder(
                          shrinkWrap: false,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / (size.height / 1.8),
                          ),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            final recipe = recipeList[0];
                            final recipeName =
                                recipeList[0].hits[index].recipe.label;
                            final cusineName =
                                recipeList[0].hits[index].recipe.cuisineType;
                            final mealType =
                                recipeList[0].hits[index].recipe.mealType;
                            final dishType =
                                recipeList[0].hits[index].recipe.dishType;
                            final ingredient = recipeList[0]
                                .hits[index]
                                .recipe
                                .ingredientLines;

                            return RecipeCart(
                              lblText: recipeName,
                              lblImage: recipeList[0].hits[index].recipe.image,
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
      ),
    );
  }
}
