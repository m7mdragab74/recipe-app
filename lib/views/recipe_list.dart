import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe_card_model.dart';
import 'package:recipe_app/views/favorite_recipe.dart';
import 'package:recipe_app/widget/custom_app_bar.dart';
import 'package:recipe_app/widget/custom_botton_nav_bar.dart';
import 'package:recipe_app/widget/recipe_card.dart';

class RecipesListPage extends StatefulWidget {
  const RecipesListPage({super.key});

  static const primaryColor = Colors.blue; // Define primary color

  @override
  State<RecipesListPage> createState() => _RecipesListPageState();
}

class _RecipesListPageState extends State<RecipesListPage> {
  int _selectedIndex = 0;

  final List<RecipeCardModel> recipes = [
    RecipeCardModel(
      imagePath: 'assets/IMG_3667.HEIC',
      titleName: 'friends',
    ),
    RecipeCardModel(
      imagePath: 'assets/IMG_3667.HEIC',
      titleName: 'friends',
    ),
    RecipeCardModel(
      imagePath: 'assets/IMG_3667.HEIC',
      titleName: 'friends',
    ),
    RecipeCardModel(
      imagePath: 'assets/IMG_3667.HEIC',
      titleName: 'friends',
    ),
    RecipeCardModel(
      imagePath: 'assets/IMG_3667.HEIC',
      titleName: 'friends',
    ),
  ];
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
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9,
            mainAxisSpacing: 1,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: RecipeCard(
                imagePath: recipes[index],
                titleName: recipes[index],
              ),
            );
          }),
    );
  }
}
