import 'package:flutter/material.dart';

class SearchingBar extends StatefulWidget {
  final void Function(String) onSearchSubmitted;
  const SearchingBar({super.key, required this.onSearchSubmitted});

  @override
  State<SearchingBar> createState() => _SearchingBarState();
}

class _SearchingBarState extends State<SearchingBar> {
  final TextEditingController _searchRecipe = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 231, 235),
        border: Border.all(color: const Color(0xFFF4F5F9)),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .01),
        child: TextField(
          controller: _searchRecipe,
          style: const TextStyle(color: Colors.black, fontSize: 15),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: size.height * .02),
            prefixIcon: GestureDetector(
              onTap: () {
                widget.onSearchSubmitted(_searchRecipe.text);
              },
              child: Icon(
                Icons.search,
                size: size.height * 0.04,
                color: Colors.green,
              ),
            ),
            hintText: 'Search Recipe....',
            hintStyle: const TextStyle(
              color: Color(0xFF8F8F9E),
              fontSize: 15,
              fontFamily: 'Poppins',
            ),
            border: InputBorder.none,
          ),
          onChanged: (value) {
            widget.onSearchSubmitted(value);
          },
        ),
      ),
    );
  }
}
