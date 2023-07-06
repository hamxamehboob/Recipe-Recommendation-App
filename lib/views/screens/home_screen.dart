import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/constants/assets.dart';

import 'package:recipe_recommendation_app/views/widgets/search_bar.dart';

import '../../services/home_page_controller.dart';
import '../../models/recipe_model.dart';
import '../widgets/recipe_cart.dart';

// HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeList = [];
  bool isLoading = false;
  final HomePageController _homePageLogic = HomePageController();

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    setState(() {
      isLoading = true;
    });

    List<Recipe> recipes = await _homePageLogic.fetchRecipes();

    setState(() {
      recipeList = recipes;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF868889),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .02),
                SizedBox(
                  height: size.height * 1.35,
                  child: GridView.builder(
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: size.width / (size.height / 1.8),
                    ),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      final recipe = recipeList.isNotEmpty
                          ? recipeList[0].hits[index].recipe.label
                          : null;
                      final cusineName = recipeList.isNotEmpty
                          ? recipeList[0].hits[index].recipe.cuisineType
                          : null;
                      final mealType = recipeList.isNotEmpty
                          ? recipeList[0].hits[index].recipe.mealType
                          : null;
                      final dishType = recipeList.isNotEmpty
                          ? recipeList[0].hits[index].recipe.dishType
                          : null;
                      final recipeName = recipe;

                      return RecipeCart(
                        lblText: recipeList.isNotEmpty
                            ? recipeList[0].hits[index].recipe.label
                            : 'loading...',
                        lblImage: recipeList.isNotEmpty
                            ? recipeList[0].hits[index].recipe.image
                            : '',
                        recipeName: recipeName.toString(),
                        dishType: dishType.toString(),
                        cusineName: cusineName.toString(),
                        mealType: mealType.toString(),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
