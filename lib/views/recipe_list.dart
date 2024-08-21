import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:recipe_app/views/favorite_recipe.dart';
import 'package:recipe_app/widget/recipe%20list/custom_app_bar.dart';
import 'package:recipe_app/widget/recipe%20list/custom_botton_nav_bar.dart';
import 'package:recipe_app/widget/recipe%20list/recipe_card.dart';

class RecipesListPage extends StatefulWidget {
  const RecipesListPage({super.key});

  static const primaryColor = Colors.blue;

  @override
  State<RecipesListPage> createState() => _RecipesListPageState();
}

class _RecipesListPageState extends State<RecipesListPage> {
  int _selectedIndex = 0;
  List<RecipeModel> _recipes = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  Future<void> _fetchRecipes() async {
    final recipeService = RecipeService();
    try {
      final recipes = await recipeService.getRecipes();
      setState(() {
        _recipes = recipes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load recipes. Please try again later.';
        _isLoading = false;
      });
    }
  }

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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 9,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: _recipes.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: RecipeCard(
                        recipe: _recipes[index],
                      ),
                    );
                  },
                ),
    );
  }
}
