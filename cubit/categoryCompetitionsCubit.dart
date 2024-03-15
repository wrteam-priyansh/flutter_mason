
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CategoryCompetitionsState {}

class CategoryCompetitionsInitial extends CategoryCompetitionsState {}


class CategoryCompetitionsFetchInProgress extends CategoryCompetitionsState {}


class CategoryCompetitionsFetchSuccess extends CategoryCompetitionsState {}


class CategoryCompetitionsFetchFailure extends CategoryCompetitionsState {
  final String errorMessage;

  CategoryCompetitionsFetchFailure(this.errorMessage);

  
}

class CategoryCompetitionsCubit extends Cubit<CategoryCompetitionsState> {

  final CompetitionRepository _competitionRepository;

  CategoryCompetitionsCubit(this._competitionRepository) : super(CategoryCompetitionsInitial());

}