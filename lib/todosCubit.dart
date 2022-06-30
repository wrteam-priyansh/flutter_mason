
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TodosState {}

class TodosInitial extends TodosState {}


class TodosFetchInProgress extends TodosState {}


class TodosFetchSuccess extends TodosState {}


class TodosFetchFailure extends TodosState {}

class TodosCubit extends Cubit<TodosState> {

  final TodoRepository _todoRepository;

  TodosCubit(this._todoRepository) : super(TodosInitial());

}