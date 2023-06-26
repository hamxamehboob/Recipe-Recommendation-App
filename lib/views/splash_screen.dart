import 'package:flutter/material.dart';
import 'package:recipe_recommendation_app/views/home_screen.dart';

import '../constants/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // navigateToHome();
  }

  // navigateToHome() async {
  //   await Future.delayed(const Duration(seconds: 5)).then((value) =>
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (_) => const HomePage())));
  // }

  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(splash_Image1), fit: BoxFit.cover),
            ),
          ),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.1,
                      top: 96,
                      right: 110,
                    ),
                  ),
                  const Text("Welcome to",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          letterSpacing: 0.03,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins')),
                  const SizedBox(height: 1),
                  Container(
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(splash_Image2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  Container(
                    padding: const EdgeInsets.only(right: 47, left: 47),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy",
                        style: TextStyle(
                            color: Color(0xFF868889),
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            letterSpacing: 0.03),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height,
                  ),
                  const Text(
                    "POWERED BY",
                    style: TextStyle(
                        color: Color(0xFF868889),
                        fontSize: 15,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height),
                  const Text(
                    "Hamza Mehboob",
                    style: TextStyle(
                        color: Color(0xFF6CC51D),
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        letterSpacing: 3),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
