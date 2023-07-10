import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RecipeCartShimmer extends StatelessWidget {
  const RecipeCartShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: size.height / 3.8,
        width: size.width * .46,
        color: const Color.fromARGB(255, 237, 236, 236),
      ),
    );
  }
}
