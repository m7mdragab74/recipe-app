import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_card_model.dart';

class RecipeCard extends StatefulWidget {
  RecipeCard({super.key, required this.titleName, required this.imagePath});

  final RecipeCardModel titleName;
  final RecipeCardModel imagePath;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 4 / 3, // Adjust the aspect ratio as needed
                child: Image.asset(
                  widget.imagePath.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
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
        SizedBox(
          height: 4,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            widget.titleName.titleName,
            style: TextStyle(
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
