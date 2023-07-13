import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeCardShimmer extends StatelessWidget {
  const RecipeCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(left: size.width * .01, top: size.height * .004),
      child: SizedBox(
        height: size.height / 3.8,
        width: size.width * .46,
        child: Shimmer.fromColors(
          baseColor: const Color.fromRGBO(224, 224, 224, 1),
          highlightColor: const Color.fromRGBO(245, 245, 245, 1),
          child: Container(
            height: size.height / 3.8,
            width: size.width * .46,
            color: const Color.fromARGB(255, 237, 236, 236),
          ),
        ),
      ),
    );
  }
}
