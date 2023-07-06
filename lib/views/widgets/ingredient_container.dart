import 'package:flutter/material.dart';

import '../../constants/assets.dart';

class IngredientBox extends StatelessWidget {
  const IngredientBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.only(top: size.height * .03),
      width: size.width * 1,
      height: size.height * .06,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 3),
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            height: size.height * .1,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            child: Image.asset(chefHat),
          ),
          SizedBox(width: size.width * .03),
          const Text(
            '1/2 Tea Spoon',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
