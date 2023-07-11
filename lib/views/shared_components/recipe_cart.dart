import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:recipe_recommendation_app/views/screens/information_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeCart extends StatefulWidget {
  final String lblText;
  final String lblImage;
  final String recipeName;
  final String cusineName;
  final String mealType;
  final String dishType;
  final List<String> ingredientInfo;
  const RecipeCart({
    required this.lblText,
    required this.lblImage,
    Key? key,
    required this.recipeName,
    required this.cusineName,
    required this.mealType,
    required this.dishType,
    required this.ingredientInfo,
  }) : super(key: key);

  @override
  State<RecipeCart> createState() => _RecipeCartState();
}

class _RecipeCartState extends State<RecipeCart> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: size.height * .02),
          height: size.height / 3.8,
          width: size.width * .49,
          color: const Color.fromARGB(255, 237, 236, 236),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InformationScreen(
                        recipeName: widget.recipeName,
                        recipeImage: widget.lblImage,
                        dishType: widget.dishType,
                        cusineName: widget.cusineName,
                        mealType: widget.mealType,
                        ingredientInfo: widget.ingredientInfo,
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    if (widget.lblImage.isNotEmpty)
                      CircleAvatar(
                        maxRadius: size.height * .08,
                        backgroundImage:
                            CachedNetworkImageProvider(widget.lblImage),
                        backgroundColor: Colors.transparent,
                      ),
                    if (widget.lblImage.isEmpty)
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
                height: size.height * .03,
              ),
              Text(
                widget.lblText,
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
