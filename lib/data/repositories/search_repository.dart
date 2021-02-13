import 'dart:convert';

import 'package:grocerie_app/data/model/food.dart';
import 'package:http/http.dart' as http;

abstract class SearchRepository {
  Future<List<Recipe>> searchFoods(String query);
}

class SearchRepositoryImpl extends SearchRepository {
  @override
  Future<List<Recipe>> searchFoods(String query) async {
    var response =
        await http.get('https://forkify-api.herokuapp.com/api/search?q=$query');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Recipe> recipes = Food.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}
