import 'package:flutter/material.dart';
import 'package:recipe_app/widget/custome_app_bar.dart';

class RecipesList extends StatelessWidget {
  RecipesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Recipes List',
      ),
    );
  }
}
