import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recipe_recommendation_app/constants/assets.dart';
import 'package:recipe_recommendation_app/controllers/home_page_controller.dart';
import 'package:recipe_recommendation_app/models/recipe_model.dart';
import 'package:recipe_recommendation_app/views/shared_components/recipe_cart.dart';
import 'package:recipe_recommendation_app/views/shared_components/search_bar.dart';
import 'package:recipe_recommendation_app/views/shared_components/shimmer_effect.dart';

import '../shared_components/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController _homePageLogic = HomePageController();

  late Future<List<Recipe>> _recipeFuture;
  late StreamSubscription _subscription;

  bool _showAllRecipes = true;

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
    _getConnectivity();
  }

  _fetchRecipes() {
    setState(() {
      _showAllRecipes = true;
      _recipeFuture = _homePageLogic.fetchRecipes();
    });
  }

  _onSearchSubmitted(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _showAllRecipes = false;
        _recipeFuture = _homePageLogic.searchRecipes(query);
      });
    } else {
      _fetchRecipes();
    }
  }

  _getConnectivity() async {
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
    setState(() {});

    if (!isDeviceConnected) {
      // ignore: use_build_context_synchronously
      showInternetConnectionDialog(context);
    }

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected) {
        // ignore: use_build_context_synchronously
        showInternetConnectionDialog(context);
      } else {
        setState(() {
          _fetchRecipes();
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                SearchingBar(onSearchSubmitted: _onSearchSubmitted),
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
                SizedBox(height: size.height * .02),
                FutureBuilder<List<Recipe>>(
                  future: _recipeFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error occurred: ${snapshot.error}',
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No Recipe Found',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      } else {
                        final recipeList = snapshot.data!;
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / (size.height / 1.82),
                          ),
                          itemCount: _showAllRecipes
                              ? recipeList[0].hits.length
                              : recipeList[0].hits.length,
                          itemBuilder: (context, index) {
                            final recipe = recipeList[0].hits[index].recipe;
                            final recipeName = recipe.label;
                            final cusineName = recipe.cuisineType;
                            final mealType = recipe.mealType;
                            final dishType = recipe.dishType;
                            final ingredient = recipe.ingredientLines;

                            return RecipeCard(
                              lblText: recipeName,
                              lblImage:
                                  _showAllRecipes ? recipe.image : recipe.image,
                              dishType: dishType.toString(),
                              cusineName: cusineName.toString(),
                              mealType: mealType.toString(),
                              ingredientInfo: ingredient,
                            );
                          },
                        );
                      }
                    } else {
                      return SizedBox(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: size.width / (size.height / 1.87),
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return RecipeCardShimmer();
                          },
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
