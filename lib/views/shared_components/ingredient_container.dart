import 'package:flutter/material.dart';

import '../../constants/assets.dart';

class IngredientBox extends StatelessWidget {
  final String ingredientInfo;
  const IngredientBox({super.key, required this.ingredientInfo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(top: size.height * .03),
      width: size.width * 1,
      height: size.height * .08,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 3),
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * .01,
          ),
          Container(
            height: size.height * .08,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Image.asset(chefHat),
          ),
          SizedBox(width: size.width * .03),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                ingredientInfo,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
