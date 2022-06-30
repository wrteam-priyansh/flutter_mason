import 'package:flutter_bloc/flutter_bloc.dart';

abstract class QuestionsState {}

class QuestionsInitial extends QuestionsState {}

class QuestionsFetchInProgress extends QuestionsState {}

class QuestionsFetchSuccess extends QuestionsState {}

class QuestionsFetchFailure extends QuestionsState {}

class QuestionsCubit extends Cubit<QuestionsState> {
  final QuizRepository _quizRepository;

  QuestionsCubit(this._quizRepository) : super(QuestionsInitial());
}
