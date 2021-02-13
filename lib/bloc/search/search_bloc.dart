import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerie_app/bloc/search/search_event.dart';
import 'package:grocerie_app/bloc/search/search_state.dart';
import 'package:grocerie_app/data/model/food.dart';
import 'package:grocerie_app/data/repositories/search_repository.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchRepository searchRepository;
  SearchBloc({@required this.searchRepository}) : super(null);

  SearchState get initialState => SearchUninitialized();
  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is Search) {
      yield SearchUninitialized();

      try {
        List<Recipe> recipes = await searchRepository.searchFoods(event.query);
        yield SearchLoaded(recipes: recipes);
      } catch (e) {
        yield SearchError();
      }
    }
  }
}
