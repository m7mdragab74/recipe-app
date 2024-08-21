import 'package:flutter/material.dart';
import 'package:recipe_app/database/db_helper.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/widget/details%20page/details_widget.dart';
import 'package:recipe_app/services/recipe_services.dart';

class RecipeDetailsPage extends StatefulWidget {
  final int recipeId;

  const RecipeDetailsPage({super.key, required this.recipeId});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  bool _isLoading = true;
  String _errorMessage = '';
  RecipeModel? _recipe;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _fetchRecipeDetails();
  }

  Future<void> _fetchRecipeDetails() async {
    final recipeService = RecipeService();
    try {
      final recipe = await recipeService.getRecipeDetails(widget.recipeId);
      final db = DatabaseHelper();
      final favorites = await db.getFavorites();
      setState(() {
        _recipe = recipe;
        _isFavorite = favorites.any((fav) => fav.id == widget.recipeId);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage =
            'Failed to load recipe details. Please try again later.';
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      final db = DatabaseHelper();
      if (_isFavorite) {
        await db.deleteFavorite(widget.recipeId);
      } else {
        if (_recipe != null) {
          await db.insertFavorite(_recipe!);
        }
      }
      setState(() {
        _isFavorite = !_isFavorite;
      });
    } catch (e) {
      // Handle or log error
      print("Error toggling favorite: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff4A7C74),
            size: 29,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.black,
              size: 29,
            ),
          ),
          const SizedBox(width: 19),
          const Icon(Icons.play_arrow_outlined, size: 29, color: Colors.black),
          const SizedBox(width: 19),
          const Icon(Icons.shopping_cart_outlined,
              size: 29, color: Colors.black),
          const SizedBox(width: 19),
          const Icon(Icons.share, size: 29, color: Colors.black),
          const SizedBox(width: 29),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : (_recipe != null
                  ? DetailsWidget(recipe: _recipe!)
                  : const Center(child: Text('Recipe not found'))),
    );
  }
}
