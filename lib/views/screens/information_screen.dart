import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/constants/extensions.dart';
import 'package:recipe_recommendation_app/views/screens/home_screen.dart';
import 'package:recipe_recommendation_app/views/shared_components/ingredient_container.dart';

class InformationScreen extends StatefulWidget {
  final String recipeName;
  final String recipeImage;
  final String cusineName;
  final String mealType;
  final String dishType;
  final List<String> ingredientInfo;
  const InformationScreen({
    super.key,
    required this.recipeName,
    required this.recipeImage,
    required this.cusineName,
    required this.mealType,
    required this.dishType,
    required this.ingredientInfo,
  });

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0),
                    ),
                    child: CachedNetworkImage(
                      width: size.width,
                      fit: BoxFit.cover,
                      imageUrl: widget.recipeImage,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * .05,
                      top: size.height * .02,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: size.height * .05,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * .03,
                  top: size.height * .03,
                  right: size.width * .03,
                  bottom: size.height * .03,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recipe Name:${widget.recipeName}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        'Cuisine Name:${widget.cusineName.replaceAll('[', '').replaceAll(']', '').capitilize()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        'Dish Type:${widget.dishType.replaceAll('[', '').replaceAll(']', '').capitilize()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        'Meal Type:${widget.mealType.replaceAll('[', '').replaceAll(']', '').capitilize()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      const Text(
                        'Ingredients',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.ingredientInfo.length,
                        itemBuilder: (_, index) {
                          final ingredientInfo = widget.ingredientInfo[index];
                          return IngredientBox(
                            ingredientInfo: ingredientInfo.capitilize(),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
