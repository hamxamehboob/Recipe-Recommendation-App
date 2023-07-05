import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:recipe_recommendation_app/views/screens/information_screen.dart';

class RecipeCart extends StatelessWidget {
  final String lblText;
  final String lblImage;

  const RecipeCart({
    required this.lblText,
    required this.lblImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width * .46,
          color: const Color.fromARGB(255, 237, 236, 236),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(left: 120, top: 10),
                  child: Icon(Icons.favorite_border),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const InformationScreen(),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    if (lblImage.isNotEmpty)
                      CircleAvatar(
                        maxRadius: size.height * .08,
                        backgroundImage: NetworkImage(lblImage),
                        backgroundColor: Colors.transparent,
                      ),
                    if (lblImage.isEmpty)
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
                height: size.height * .01,
              ),
              Text(
                lblText,
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
