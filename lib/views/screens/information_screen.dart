import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/constants/assets.dart';
import 'package:recipe_recommendation_app/views/screens/home_screen.dart';

class InformationScreen extends StatefulWidget {
  final String recipeId;
  const InformationScreen({super.key, required this.recipeId});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                      bottomRight: Radius.circular(32.0),
                    ),
                    child: Image.asset(
                      homeScreenImage,
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * .05,
                      top: size.height * .02,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          size: size.height * .05,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * .03,
                  top: size.height * .03,
                ),
                child: const Column(
                  children: [
                    Text(
                      'Label from API',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
