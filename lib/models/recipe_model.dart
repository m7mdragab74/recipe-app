class RecipeModel {
  final int id;
  final String title;
  final String image;
  final String summary;
  final int time;
  final int healthScore;
  final List<String> ingredients;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.time,
    required this.summary,
    required this.ingredients,
    required this.healthScore,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    final ingredients = (json['extendedIngredients'] as List<dynamic>?)
            ?.map((ingredient) => ingredient['original'] as String)
            .toList() ??
        [];

    return RecipeModel(
      id: json['id'] as int,
      title: json['title'] ?? 'No title',
      image: json['image'] ?? '',
      time: json['readyInMinutes'] ?? 0,
      summary: json['summary'] ?? 'No summary',
      ingredients: ingredients,
      healthScore: json['healthScore'] ?? 0, // Ensure this is an int
    );
  }
}
