import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:recipe_recommendation_app/views/screens/information_screen.dart';

import '../../constants/apis.dart';
import '../../models/recipe_model.dart';
import 'package:http/http.dart' as http;

class RecipeCart extends StatefulWidget {
  final String Text;
  final String image;
  const RecipeCart({Key? key, required this.Text, required this.image});
  @override
  State<RecipeCart> createState() => _RecipeCartState();
}

class _RecipeCartState extends State<RecipeCart> {
  List<Recipe> recipeList = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _getRecipe();
  }

  _getRecipe() async {
    setState(() {
      isLoading = true;
    });
    try {
      var uri = Uri.parse(APIConfig.url);
      var response = await http.get(uri);
      var responseString = response.body;
      Map<String, dynamic> parsedJson = jsonDecode(responseString);
      setState(() {
        recipeList.add(Recipe.fromJson(parsedJson));
        isLoading = false; // Set loading to false when the recipe is loaded
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          width: size.width * .46,
          color: const Color.fromARGB(255, 237, 236, 236),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 120, top: 10),
                  child: Icon(Icons.favorite_border),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InformationScreen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    if (!isLoading && recipeList.isNotEmpty)
                      CircleAvatar(
                        maxRadius: size.height * .08,
                        backgroundImage:
                            NetworkImage(recipeList[0].hits[0].recipe.image),
                        backgroundColor: Colors.transparent,
                      ),
                    if (isLoading)
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: CircleAvatar(
                          maxRadius: size.height * .08,
                          backgroundColor: Colors.grey[300],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                recipeList.isNotEmpty
                    ? recipeList[0].hits[0].recipe.label
                    : 'loading...',
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 10,
                style: const TextStyle(
                  color: Color.fromARGB(255, 12, 13, 12),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
