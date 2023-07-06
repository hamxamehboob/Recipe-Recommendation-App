import 'package:flutter/material.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4F5F9),
        border: Border.all(color: const Color(0xFFF4F5F9)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .01),
        child: TextField(
          style: const TextStyle(color: Colors.black, fontSize: 15),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            prefixIcon: Icon(Icons.search, size: size.height * 0.04),
            hintText: 'Search Recipie....',
            hintStyle: const TextStyle(
              color: Color(0xFF8F8F9E),
              fontSize: 15,
              fontFamily: 'Poppins',
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
