class RecipeModel {
  final String title;
  final String image;
  final String summary;
  final int time;
  final List<String> ingredients;

  RecipeModel({
    required this.title,
    required this.image,
    required this.time,
    required this.summary,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    final ingredients = (json['extendedIngredients'] as List<dynamic>?)
            ?.map((ingredient) => ingredient['original'] as String)
            .toList() ??
        [];

    return RecipeModel(
      title: json['title'] ?? 'No title',
      image: json['image'] ?? '',
      time: json['readyInMinutes'] ?? 0,
      summary: json['summary'] ?? 'No summary',
      ingredients: ingredients,
    );
  }
}
