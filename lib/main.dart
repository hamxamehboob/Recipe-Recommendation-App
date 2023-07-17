import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_recommendation_app/views/screens/splash_screen.dart';
import 'package:recipe_recommendation_app/views/theme/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
