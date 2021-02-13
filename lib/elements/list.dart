import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:grocerie_app/data/model/food.dart';
import 'package:grocerie_app/ui/food_detail.dart';

Widget buildHintsList(List<Recipe> recipes) {
  //SearchFoodBloc searchBloc;
  return Container(
    child: Column(
      children: [
        new ListView.builder(
            itemCount: recipes.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FoodDetail(recipes: recipes[index])));
                  },
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 90,
                            width: 100,
                            child: Image.network(recipes[index].imageUrl)),
                        // SizedBox(height: 30),
                        Text(recipes[index].title),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    ),
  );
}
