
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EditTodoState {}

class EditTodoInitial extends EditTodoState {}


class EditTodoeditInProgress extends EditTodoState {}


class EditTodoeditSuccess extends EditTodoState {}


class EditTodoeditFailure extends EditTodoState {
  final String errorMessage;

  EditTodoeditFailure(this.errorMessage);

  
}

class EditTodoCubit extends Cubit<EditTodoState> {

  final TodoRepository _todoRepository;

  EditTodoCubit(this._todoRepository) : super(EditTodoInitial());

}