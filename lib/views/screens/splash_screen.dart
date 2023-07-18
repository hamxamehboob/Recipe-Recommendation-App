import 'package:flutter/material.dart';

import '../../constants/assets.dart';
import '../theme/theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ThemeData myTheme = theme();

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
    final size = MediaQuery.sizeOf(context);

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
              Text(
                'Welcome to',
                style: myTheme.textTheme.titleLarge,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              Text(
                'Foodie Fiesta',
                style: myTheme.textTheme.titleSmall,
              ),
              SizedBox(height: size.height * 0.1),
              Container(
                padding: const EdgeInsets.only(right: 47, left: 47),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    splashScreenText,
                    style: myTheme.textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
              ),
              Text(
                'Developed by',
                style: myTheme.textTheme.titleMedium,
              ),
              SizedBox(height: size.height * 0.01),
              Text('Hamza Mehboob', style: myTheme.textTheme.titleSmall),
            ],
          ),
        ],
      ),
    );
  }
}
