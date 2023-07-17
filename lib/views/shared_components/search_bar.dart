import 'package:flutter/material.dart';

import '../theme/theme.dart';

class SearchingBar extends StatelessWidget {
  final void Function(String) onSearchSubmitted;
  SearchingBar({super.key, required this.onSearchSubmitted});
  final ThemeData myTheme = theme();
  final TextEditingController _searchRecipe = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.white),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: size.height * .01),
        child: TextField(
          controller: _searchRecipe,
          style: myTheme.textTheme.bodySmall,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: size.height * .02),
            prefixIcon: GestureDetector(
              onTap: () {
                onSearchSubmitted(_searchRecipe.text);
              },
              child: Icon(
                Icons.search,
                size: size.height * 0.04,
                color: AppColors.primary,
              ),
            ),
            hintText: 'Search Recipe....',
            hintStyle: myTheme.textTheme.labelSmall,
            border: InputBorder.none,
          ),
          onChanged: (value) {
            onSearchSubmitted(value);
          },
        ),
      ),
    );
  }
}
