import 'package:dio/dio.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeService {
  final Dio dio;

  RecipeService(this.dio);

  Future<List<RecipeModel>> getRecipes() async {
    try {
      Response response = await dio.get('path');

      Map<String, dynamic> jsonData = response.data;

      List<dynamic> recipes = jsonData['recipes'];

      List<RecipeModel> recipeList = [];

      for (var recipes in recipes) {
        RecipeModel recipeModel = RecipeModel.fromJson(recipes);
        recipeList.add(recipeModel);
      }
      return recipeList;
    } catch (e) {
      return [];
    }
  }
}
