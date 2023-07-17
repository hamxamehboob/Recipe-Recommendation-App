import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_recommendation_app/constants/extensions.dart';
import 'package:recipe_recommendation_app/views/screens/home_screen.dart';
import 'package:recipe_recommendation_app/views/shared_components/ingredient_container.dart';
import 'package:recipe_recommendation_app/views/theme/theme.dart';

class InformationScreen extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    ThemeData myTheme = theme();

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
                      imageUrl: recipeImage,
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
                          color: AppColors.primary,
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: size.height * .05,
                          color: AppColors.white,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Recipe Name:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Expanded(
                            child: Text(
                              recipeName,
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: myTheme.textTheme.displayLarge,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Cuisine Name:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Expanded(
                            child: Text(
                              cusineName
                                  .replaceAll('[', '')
                                  .replaceAll(']', '')
                                  .capitilize(),
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: myTheme.textTheme.displayLarge,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Dish Type:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Expanded(
                            child: Text(
                              dishType
                                  .replaceAll('[', '')
                                  .replaceAll(']', '')
                                  .capitilize(),
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: myTheme.textTheme.displayLarge,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Meal Type:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: size.width * .02,
                          ),
                          Expanded(
                            child: Text(
                              mealType
                                  .replaceAll('[', '')
                                  .replaceAll(']', '')
                                  .capitilize(),
                              softWrap: true,
                              textAlign: TextAlign.start,
                              style: myTheme.textTheme.displayLarge,
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      SizedBox(
                        height: size.height * .01,
                      ),
                      Text(
                        'Ingredients :',
                        style: myTheme.textTheme.titleSmall,
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: ingredientInfo.length,
                        itemBuilder: (_, index) {
                          final ingredient = ingredientInfo[index];
                          return IngredientBox(
                            ingredientInfo: ingredient.capitilize(),
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
