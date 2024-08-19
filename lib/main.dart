import 'package:flutter/material.dart';
import 'package:recipe_app/views/recipe_list.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipesListPage(),
    );
  }
}
