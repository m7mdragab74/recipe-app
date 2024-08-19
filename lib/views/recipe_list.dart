import 'package:flutter/material.dart';
import 'package:recipe_app/models/image_model.dart';
import 'package:recipe_app/views/favorite_recipe.dart';
import 'package:recipe_app/widget/custom_app_bar.dart';
import 'package:recipe_app/widget/custom_botton_nav_bar.dart';
import 'package:recipe_app/widget/image_card.dart';

class RecipesListPage extends StatefulWidget {
  const RecipesListPage({super.key});

  static const primaryColor = Colors.blue; // Define primary color

  @override
  State<RecipesListPage> createState() => _RecipesListPageState();
}

class _RecipesListPageState extends State<RecipesListPage> {
  int _selectedIndex = 0;

  final List<ImageModel> imageView = [
    ImageModel(image: 'assets/IMG_3667.HEIC'),
    ImageModel(image: 'assets/IMG_3667.HEIC'),
    ImageModel(image: 'assets/IMG_3667.HEIC'),
    ImageModel(image: 'assets/IMG_3667.HEIC'),
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
            mainAxisSpacing: 16,
          ),
          itemCount: imageView.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12),
              child: ImageCard(
                image: imageView[index],
              ),
            );
          }),
    );
  }
}
