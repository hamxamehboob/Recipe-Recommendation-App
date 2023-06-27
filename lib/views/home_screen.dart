import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/constants/images.dart';
import 'package:recipe_recommendation_app/views/information_screen.dart';
import 'package:recipe_recommendation_app/widgets/recipe_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(size.height * 0.01),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F5F9),
                    border: Border.all(color: const Color(0xFFF4F5F9)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 17),
                      prefixIcon: Icon(Icons.search, size: size.height * 0.04),
                      hintText: 'Search keywords..',
                      hintStyle: const TextStyle(
                        color: Color(0xFF8F8F9E),
                        fontSize: 15,
                        fontFamily: 'Poppins',
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Image.asset(homeScreenImage),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  children: [
                    const Text(
                      'Featured products',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF868889),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                GridView.count(
                  physics: const ScrollPhysics(),
                  childAspectRatio: size.height / 800,
                  crossAxisCount: 2,
                  crossAxisSpacing: size.width / size.height,
                  shrinkWrap: true,
                  children: const [
                    RecipeCart(),
                    RecipeCart(),
                    RecipeCart(),
                    RecipeCart(),
                    RecipeCart(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
