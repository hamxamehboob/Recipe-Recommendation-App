import 'package:flutter/material.dart';

import '../../constants/assets.dart';

class RecipeCart extends StatefulWidget {
  const RecipeCart({super.key});

  @override
  State<RecipeCart> createState() => _RecipeCartState();
}

class _RecipeCartState extends State<RecipeCart> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          width: size.width * .4,
          color: const Color.fromARGB(255, 237, 236, 236),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 120, top: 10),
                  child: Icon(Icons.favorite_border),
                ),
              ),
              CircleAvatar(
                maxRadius: size.height * .08,
                backgroundImage: AssetImage(homeScreenImage),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              const Text(
                'Recipe Name',
                style: TextStyle(
                  color: Color.fromARGB(255, 78, 206, 78),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              )
            ],
          ),
        ),
      ],
    );
  }
}
