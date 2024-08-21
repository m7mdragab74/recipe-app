import 'package:flutter/material.dart';
import 'package:recipe_app/database/db_helper.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/recipe_list.dart';
import 'package:recipe_app/widget/recipe%20list/custom_app_bar.dart';
import 'package:recipe_app/widget/recipe%20list/custom_botton_nav_bar.dart';
import 'package:recipe_app/widget/recipe%20list/recipe_card.dart';

class FavoriteRecipePage extends StatefulWidget {
  const FavoriteRecipePage({super.key});

  @override
  State<FavoriteRecipePage> createState() => _FavoriteRecipePageState();
}

class _FavoriteRecipePageState extends State<FavoriteRecipePage> {
  List<RecipeModel> _favorites = [];
  bool _isLoading = true;
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _fetchFavorites();
  }

  Future<void> _fetchFavorites() async {
    final db = DatabaseHelper();
    final favorites = await db.getFavorites();
    setState(() {
      _favorites = favorites;
      _isLoading = false;
    });
  }

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
      appBar: CustomAppBarWidget(
        title: 'Favorite Recipe',
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favorites.isEmpty
              ? const Center(child: Text('No favorites yet'))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: _favorites.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: RecipeCard(
                        recipe: _favorites[index],
                      ),
                    );
                  },
                ),
    );
  }
}
