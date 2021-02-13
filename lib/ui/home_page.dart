import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocerie_app/bloc/food_bloc.dart';
import 'package:grocerie_app/bloc/food_event.dart';
import 'package:grocerie_app/bloc/food_state.dart';
import 'package:grocerie_app/bloc/search/search_bloc.dart';
import 'package:grocerie_app/bloc/search/search_event.dart';
import 'package:grocerie_app/bloc/search/search_state.dart';
import 'package:grocerie_app/elements/error.dart';
import 'package:grocerie_app/elements/list.dart';
import 'package:grocerie_app/elements/loading.dart';
import 'package:grocerie_app/ui/food_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FoodBloc foodBloc;

  @override
  void initState() {
    foodBloc = BlocProvider.of<FoodBloc>(context);
    foodBloc.add(FetchFoodEvent());
    //searchFoodBloc.add(TextChanged(query: ))
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: FoodSearch(
                        searchBloc: BlocProvider.of<SearchBloc>(context)));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
            if (state is FoodInitialState) {
              return buildLoading();
            } else if (state is FoodLoadingState) {
              return buildLoading();
            } else if (state is FoodLoadedState) {
              return buildHintsList(state.recipes);
            } else if (state is FoodErrorState) {
              return buildError(state.message);
            }
          }),
        ),
      ),
    );
  }
}

class FoodSearch extends SearchDelegate<List> {
  SearchBloc searchBloc;
  FoodSearch({@required this.searchBloc});
  String queryString;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    queryString = query;
    searchBloc.add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, SearchState state) {
        if (state is SearchUninitialized) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchError) {
          return Center(
            child: Text('Failed To Load'),
          );
        }
        if (state is SearchLoaded) {
          if (state.recipes.isEmpty) {
            return Center(
              child: Text('No Results'),
            );
          }
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FoodDetail(recipes: state.recipes[index])));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 90,
                            width: 100,
                            child:
                                Image.network(state.recipes[index].imageUrl)),
                        Text(state.recipes[index].title),
                      ],
                    ),
                  ),
                );

                //Text(state.recipes[index].title);
              },
              itemCount: state.recipes.length);
        }
        return Scaffold();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
