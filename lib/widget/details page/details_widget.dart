import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/widget/details%20page/custom_container.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.recipe});
  final RecipeModel recipe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              recipe.image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: TextStyle(
                    color: Color(0xff4A7C74),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    CustomContainer(
                      title: 'hs: ${recipe.healthScore.toString()}',
                    ),
                    CustomContainer(
                      title: '${recipe.time} min',
                      icon: Icons.timelapse,
                    ),
                    CustomContainer(
                      title: 'Ingredients',
                      icon: Icons.nightlife_rounded,
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  recipe.summary,
                  style: TextStyle(fontSize: 16, height: 1.5),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
