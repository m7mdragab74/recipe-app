import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/services/recipe_services.dart';
import 'package:recipe_app/widget/details%20page/details_widget.dart';

class RecipeDetailsPage extends StatefulWidget {
  final int recipeId; // Ensure this is an int or String as per your model

  const RecipeDetailsPage({super.key, required this.recipeId});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  bool _isLoading = true;
  String _errorMessage = '';
  RecipeModel? _recipe;

  @override
  void initState() {
    super.initState();
    _fetchRecipeDetails();
  }

  Future<void> _fetchRecipeDetails() async {
    final recipeService = RecipeService();
    try {
      final recipe = await recipeService.getRecipeDetails(widget.recipeId);
      setState(() {
        _recipe = recipe;
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
        actions: const [
          Icon(Icons.favorite, color: Colors.red, size: 29),
          SizedBox(width: 19),
          Icon(Icons.play_arrow_outlined, size: 29, color: Colors.black),
          SizedBox(width: 19),
          Icon(Icons.shopping_cart_outlined, size: 29, color: Colors.black),
          SizedBox(width: 19),
          Icon(Icons.share, size: 29, color: Colors.black),
          SizedBox(width: 29),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage.isNotEmpty
              ? Center(child: Text(_errorMessage))
              : (_recipe != null
                  ? DetailsWidget(recipe: _recipe!)
                  : Center(child: Text('Recipe not found'))),
    );
  }
}
