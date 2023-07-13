import 'package:flutter/material.dart';

import 'package:recipe_recommendation_app/views/screens/information_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RecipeCard extends StatefulWidget {
  final String lblText;
  final String lblImage;

  final String cusineName;
  final String mealType;
  final String dishType;
  final List<String> ingredientInfo;
  const RecipeCard({
    required this.lblText,
    required this.lblImage,
    Key? key,
    required this.cusineName,
    required this.mealType,
    required this.dishType,
    required this.ingredientInfo,
  }) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: size.height * .01),
          height: size.height / 4,
          width: size.width * .45,
          color: const Color.fromARGB(255, 237, 236, 236),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InformationScreen(
                        recipeName: widget.lblText,
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
