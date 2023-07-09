import 'package:flutter/material.dart';

import '../../controllers/home_page_controller.dart';
import '../../models/recipe_model.dart';
import '../widgets/recipe_cart.dart';

class AllRecipiesScreen extends StatefulWidget {
  const AllRecipiesScreen({super.key});

  @override
  State<AllRecipiesScreen> createState() => _AllRecipiesScreenState();
}

class _AllRecipiesScreenState extends State<AllRecipiesScreen> {
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
        appBar: AppBar(
          title: const Text('All Recipies'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * .02),
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
                      height: size.height * 2.77,
                      child: GridView.builder(
                        shrinkWrap: false,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: size.width / (size.height / 1.8),
                        ),
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          // final recipe = recipeList[0];
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
    );
  }
}
