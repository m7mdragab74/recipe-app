import 'package:flutter/material.dart';
import 'package:recipe_app/views/favorite_recipe.dart';
import 'package:recipe_app/widget/custom_app_bar.dart';
import 'package:recipe_app/widget/custom_botton_nav_bar.dart';

class RecipesListPage extends StatefulWidget {
  const RecipesListPage({super.key});

  static const primaryColor = Colors.blue; // Define primary color

  @override
  State<RecipesListPage> createState() => _RecipesListPageState();
}

class _RecipesListPageState extends State<RecipesListPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        pages: const [
          RecipesListPage(),
          FavoriteRecipePage(),
        ],
        color: RecipesListPage.primaryColor,
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      appBar: const CustomAppBarWidget(
        title: 'Recipes List',
      ),
    );
  }
}
