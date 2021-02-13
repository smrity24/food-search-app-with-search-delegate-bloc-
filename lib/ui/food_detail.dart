import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocerie_app/data/model/food.dart';

class FoodDetail extends StatelessWidget {
  final Recipe recipes;
  FoodDetail({@required this.recipes});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipes.title),
      ),
      body: Column(
        children: [
          Image.network(recipes.imageUrl),
          Text(recipes.title),
          Text(recipes.publisher),
        ],
      ),
    );
  }
}
