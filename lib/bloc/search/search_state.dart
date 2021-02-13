import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocerie_app/data/model/food.dart';

abstract class SearchState extends Equatable {}

class SearchUninitialized extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  List<Recipe> recipes;
  SearchLoaded({@required this.recipes});
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  @override
  List<Object> get props => [];
}
