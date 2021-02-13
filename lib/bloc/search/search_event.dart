import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SearchEvent extends Equatable {}

class Search extends SearchEvent {
  String query;

  Search({@required this.query});

  @override
  List<Object> get props => [];
}
