
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}


class {{name.pascalCase()}}{{stateType.pascalCase()}}InProgress extends {{name.pascalCase()}}State {}


class {{name.pascalCase()}}{{stateType.pascalCase()}}Success extends {{name.pascalCase()}}State {

   final int total;
  final List<{{model.pascalCase()}}> {{dataListName.camelCase()}};

  final bool fetchMoreError;
  final bool fetchMoreInProgress;

    {{name.pascalCase()}}{{stateType.pascalCase()}}Success({
      
      required this.{{dataListName.camelCase()}},
      required this.fetchMoreError,
      required this.fetchMoreInProgress,
      required this.total
    });

    {{name.pascalCase()}}{{stateType.pascalCase()}}Success copyWith({
       
       bool? fetchMoreError,
       bool? fetchMoreInProgress,
       int? total,
       List<{{model.pascalCase()}}>? {{dataListName.camelCase()}}
       
    }) {
      return {{name.pascalCase()}}{{stateType.pascalCase()}}Success(
       
        {{dataListName.camelCase()}} : {{dataListName.camelCase()}} ?? this.{{dataListName.camelCase()}},
        fetchMoreError: fetchMoreError ?? this.fetchMoreError,
        fetchMoreInProgress: fetchMoreInProgress ?? this.fetchMoreInProgress,
        total: total ?? this.total
      );

    }




}


class {{name.pascalCase()}}{{stateType.pascalCase()}}Failure extends {{name.pascalCase()}}State {
  final String errorMessage;

  {{name.pascalCase()}}{{stateType.pascalCase()}}Failure(this.errorMessage);

  
}

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  {{name.pascalCase()}}Cubit(this._{{repository.camelCase()}}) : super({{name.pascalCase()}}Initial());

  //TODO: Give proper name
  void fetch() async {
    emit({{name.pascalCase()}}{{stateType.pascalCase()}}InProgress());
    try {
      
      final result = await _{{repository.camelCase()}}.fetchData();
      emit({{name.pascalCase()}}{{stateType.pascalCase()}}Success(
          
          {{dataListName.camelCase()}}: result[{{dataListName.camelCase()}}],//Add '' here
          fetchMoreError: false,
          fetchMoreInProgress: false,
          total: result['total']));
        
    } catch (e) {
      emit({{name.pascalCase()}}{{stateType.pascalCase()}}Failure(e.toString()));
    }
  }


  bool hasMore() {
    if (state is {{name.pascalCase()}}{{stateType.pascalCase()}}Success) {
      return (state as {{name.pascalCase()}}{{stateType.pascalCase()}}Success).{{dataListName.camelCase()}}.length < 
          (state as {{name.pascalCase()}}{{stateType.pascalCase()}}Success).total;
    }
    return false;
  }


    void fetchMore() async {
    //
    if (state is {{name.pascalCase()}}{{stateType.pascalCase()}}Success) {
      if ((state as {{name.pascalCase()}}{{stateType.pascalCase()}}Success).fetchMoreInProgress) {
        return;
      }
      try {
        emit((state as {{name.pascalCase()}}{{stateType.pascalCase()}}Success)
            .copyWith(fetchMoreInProgress: true));

        
        final more{{dataListName.pascalCase()}} = await _{{repository.camelCase()}}.fetch(//Add function name
            
            page: (state as {{name.pascalCase()}}{{stateType.pascalCase()}}Success).{{dataListName.camelCase()}}.length);
        

        final currentState = (state as {{name.pascalCase()}}{{stateType.pascalCase()}}Success);

                List<{{model.pascalCase()}}> {{dataListName.camelCase()}} = currentState.{{dataListName.camelCase()}};

        
        {{dataListName.camelCase()}}.addAll(more{{dataListName.pascalCase()}}[{{dataListName.camelCase()}}]);// TODO: Add ''

        
        emit({{name.pascalCase()}}{{stateType.pascalCase()}}Success(
            fetchMoreError: false,
            fetchMoreInProgress: false,
            total: more{{dataListName.pascalCase()}}['total'],
            {{dataListName.camelCase()}}: {{dataListName.camelCase()}}));
         
      } catch (e) {
        emit((state as {{name.pascalCase()}}{{stateType.pascalCase()}}Success).copyWith(
            fetchMoreInProgress: false, fetchMoreError: true));
      }
    }
  }






}