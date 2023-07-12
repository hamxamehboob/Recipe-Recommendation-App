import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/views/screens/home_screen.dart';

import '../../constants/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(seconds: 5),
    ).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(splashImage1),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.1,
                  top: 96,
                  right: 110,
                ),
              ),
              const Text(
                'Welcome to',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  letterSpacing: 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(splashImage2),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.017),
              Container(
                padding: const EdgeInsets.only(right: 47, left: 47),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Discover a world of delicious recipes with our Recipe Recommendation app. Explore a wide range of dishes and easily search for recipes that suit your taste buds. Cooking has never been more enjoyable and accessible!',
                    style: TextStyle(
                      color: Color.fromARGB(255, 75, 75, 75),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.3,
              ),
              const Text(
                'POWERED BY',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Text(
                'Hamza Mehboob',
                style: TextStyle(
                  color: Color(0xFF6CC51D),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  letterSpacing: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
