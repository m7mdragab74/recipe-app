import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:recipe_app/models/recipe_model.dart';

class RecipeService {
  final Dio dio;

  RecipeService()
      : dio = Dio(BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        )) {
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<List<RecipeModel>> getRecipes() async {
    final apiKey = dotenv.env['API_KEY'];
    if (apiKey == null) {
      throw Exception('API key is missing');
    }

    try {
      final response = await dio.get(
        'https://api.spoonacular.com/recipes/complexSearch',
        queryParameters: {'apiKey': apiKey},
      );

      if (response.data != null && response.data['results'] != null) {
        final List<dynamic> data = response.data['results'] as List<dynamic>;
        return data.map((json) => RecipeModel.fromJson(json)).toList();
      } else {
        throw Exception('Unexpected response structure');
      }
    } catch (e) {
      print('Error fetching recipes: $e');
      if (e is DioError) {
        throw Exception('Network error: ${e.message}');
      } else {
        throw Exception('Failed to load recipes');
      }
    }
  }
}
