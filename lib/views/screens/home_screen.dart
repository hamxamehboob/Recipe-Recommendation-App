import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/constants/assets.dart';

import 'package:recipe_recommendation_app/views/widgets/search_bar.dart';
import 'package:shimmer/shimmer.dart';

import 'package:recipe_recommendation_app/views/screens/information_screen.dart';

import '../../constants/providers/home_page_logic.dart';
import '../../models/recipe_model.dart';

// HomePage widget
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipeList = [];
  bool isLoading = false;
  final HomePageLogic _homePageLogic = HomePageLogic();

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
                      return RecipeCart(
                        lblText: recipeList.isNotEmpty
                            ? recipeList[0].hits[index].recipe.label
                            : 'loading...',
                        lblImage: recipeList.isNotEmpty
                            ? recipeList[0].hits[index].recipe.image
                            : '',
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

// RecipeCart widget
class RecipeCart extends StatelessWidget {
  final String lblText;
  final String lblImage;

  const RecipeCart({
    required this.lblText,
    required this.lblImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width * .46,
          color: const Color.fromARGB(255, 237, 236, 236),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
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
                    if (lblImage.isNotEmpty)
                      CircleAvatar(
                        maxRadius: size.height * .08,
                        backgroundImage: NetworkImage(lblImage),
                        backgroundColor: Colors.transparent,
                      ),
                    if (lblImage.isEmpty)
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
                lblText,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
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
