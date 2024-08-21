import 'package:flutter/material.dart';
import 'package:recipe_app/database/db_helper.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/recipe_details.dart';

class RecipeCard extends StatefulWidget {
  final RecipeModel recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    try {
      final db = DatabaseHelper();
      final favorites = await db.getFavorites();
      setState(() {
        isFavorite = favorites.any((recipe) => recipe.id == widget.recipe.id);
      });
    } catch (e) {
      print("Error checking if favorite: $e");
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      final db = DatabaseHelper();
      if (isFavorite) {
        await db.deleteFavorite(widget.recipe.id);
      } else {
        await db.insertFavorite(widget.recipe);
      }
      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      print("Error toggling favorite: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailsPage(
                      recipeId: widget.recipe.id,
                    ),
                  ),
                ).then((value) => setState(() {
                  
                }));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: Image.network(
                    widget.recipe.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: _toggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.recipe.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
