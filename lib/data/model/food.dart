// To parse this JSON data, do
//
//     final food = foodFromJson(jsonString);

import 'dart:convert';

Food foodFromJson(String str) => Food.fromJson(json.decode(str));

String foodToJson(Food data) => json.encode(data.toJson());

class Food {
  Food({
    this.count,
    this.recipes,
  });

  int count;
  List<Recipe> recipes;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        count: json["count"],
        recipes:
            List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
      };
}

class Recipe {
  Recipe({
    this.publisher,
    this.title,
    this.sourceUrl,
    this.recipeId,
    this.imageUrl,
    this.socialRank,
    this.publisherUrl,
  });

  String publisher;
  String title;
  String sourceUrl;
  String recipeId;
  String imageUrl;
  double socialRank;
  String publisherUrl;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        publisher: json["publisher"],
        title: json["title"],
        sourceUrl: json["source_url"],
        recipeId: json["recipe_id"],
        imageUrl: json["image_url"],
        socialRank: json["social_rank"].toDouble(),
        publisherUrl: json["publisher_url"],
      );

  Map<String, dynamic> toJson() => {
        "publisher": publisher,
        "title": title,
        "source_url": sourceUrl,
        "recipe_id": recipeId,
        "image_url": imageUrl,
        "social_rank": socialRank,
        "publisher_url": publisherUrl,
      };
}
