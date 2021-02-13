import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocerie_app/data/model/food.dart';

abstract class FoodState extends Equatable {}

class FoodInitialState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadingState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadedState extends FoodState {
  List<Recipe> recipes;
  FoodLoadedState({@required this.recipes});
  @override
  List<Object> get props => null;
}

class FoodErrorState extends FoodState {
  String message;
  FoodErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
