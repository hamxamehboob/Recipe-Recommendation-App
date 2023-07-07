import 'dart:convert';

import 'package:flutter/material.dart';

import '../../app_config/api_confiq.dart';
import '../../models/recipe_model.dart';
import 'package:http/http.dart' as http;

class SearchingBar extends StatefulWidget {
  const SearchingBar({super.key});

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF4F5F9),
            border: Border.all(color: const Color(0xFFF4F5F9)),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: size.height * .01),
            child: TextField(
              // controller: _searchRecipe,
              style: const TextStyle(color: Colors.black, fontSize: 15),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: GestureDetector(
                  // onTap: onPressed,
                  child: Icon(Icons.search, size: size.height * 0.04),
                ),
                hintText: 'Search Recipe....',
                hintStyle: const TextStyle(
                  color: Color(0xFF8F8F9E),
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
