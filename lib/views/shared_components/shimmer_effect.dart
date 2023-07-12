import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeCartShimmer extends StatelessWidget {
  const RecipeCartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
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
    );
  }
}
