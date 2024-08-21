import 'package:flutter/material.dart';
import 'package:recipe_app/views/recipe_list.dart';
import 'package:recipe_app/widget/recipe%20list/custom_app_bar.dart';
import 'package:recipe_app/widget/recipe%20list/custom_botton_nav_bar.dart';

class FavoriteRecipePage extends StatefulWidget {
  const FavoriteRecipePage({super.key});

  @override
  State<FavoriteRecipePage> createState() => _FavoriteRecipePageState();
}

class _FavoriteRecipePageState extends State<FavoriteRecipePage> {
  int _selectedIndex =
      1; // Set this to 1 since it's the second tab in the nav bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        pages: const [
          RecipesListPage(),
          FavoriteRecipePage(),
        ],
        color: const Color(0xff4A7C74),
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      appBar: const CustomAppBarWidget(
        title: 'Favorite Recipe',
      ),
      body: const Center(
        child: Text('Your favorite recipes will appear here.'),
      ),
    );
  }
}
