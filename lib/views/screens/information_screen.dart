import 'package:flutter/material.dart';

import '../widgets/recipe_cart.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Screen'),
      ),
      body: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in each row
          childAspectRatio: size.width /
              (size.height / 2), // Adjust the aspect ratio as needed
        ),
        itemCount: 4,
        itemBuilder: (context, innerIndex) {
          return const RecipeCart(
            Text: '',
            image: '',
          );
        },
      ),
    );
  }
}
