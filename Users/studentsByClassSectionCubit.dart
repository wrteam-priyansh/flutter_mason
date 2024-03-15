
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StudentsByClassSectionState {}

class StudentsByClassSectionInitial extends StudentsByClassSectionState {}


class StudentsByClassSectionFetchInProgress extends StudentsByClassSectionState {}


class StudentsByClassSectionFetchSuccess extends StudentsByClassSectionState {

   final int totalPage;
  final int currentPage;
  final List<Student> students;

  final bool fetchMoreError;
  final bool fetchMoreInProgress;

    StudentsByClassSectionFetchSuccess({
      required this.currentPage,
      required this.students,
      required this.fetchMoreError,
      required this.fetchMoreInProgress,
      required this.totalPage
    });

    StudentsByClassSectionFetchSuccess copyWith({
       int? currentPage,
       bool? fetchMoreError,
       bool? fetchMoreInProgress,
       int? totalPage,
       List<Student>? students
       
    }) {
      return StudentsByClassSectionFetchSuccess(
        currentPage: currentPage ?? this.currentPage,
        students : students ?? this.students,
        fetchMoreError: fetchMoreError ?? this.fetchMoreError,
        fetchMoreInProgress: fetchMoreInProgress ?? this.fetchMoreInProgress,
        totalPage: totalPage ?? this.totalPage
      );

    }




}


class StudentsByClassSectionFetchFailure extends StudentsByClassSectionState {
  final String errorMessage;

  StudentsByClassSectionFetchFailure(this.errorMessage);

  
}

class StudentsByClassSectionCubit extends Cubit<StudentsByClassSectionState> {

  final StudentRepository _studentRepository;

  StudentsByClassSectionCubit(this._studentRepository) : super(StudentsByClassSectionInitial());

  //TODO: Give proper name
  void fetch() async {
    emit(StudentsByClassSectionFetchInProgress());
    try {
      
      final result = await _studentRepository.fetchData();
      emit(StudentsByClassSectionFetchSuccess(
          currentPage: result['currentPage'],
          students: result[students],//Add '' here
          fetchMoreError: false,
          fetchMoreInProgress: false,
          totalPage: result['totalPage']));
        
    } catch (e) {
      emit(StudentsByClassSectionFetchFailure(e.toString()));
    }
  }


  bool hasMore() {
    if (state is StudentsByClassSectionFetchSuccess) {
      return (state as StudentsByClassSectionFetchSuccess).currentPage <
          (state as StudentsByClassSectionFetchSuccess).totalPage;
    }
    return false;
  }


    void fetchMore() async {
    //
    if (state is StudentsByClassSectionFetchSuccess) {
      if ((state as StudentsByClassSectionFetchSuccess).fetchMoreInProgress) {
        return;
      }
      try {
        emit((state as StudentsByClassSectionFetchSuccess)
            .copyWith(fetchMoreInProgress: true));

        
        final moreStudents = await _studentRepository.fetch(//Add function name
            
            page: (state as StudentsByClassSectionFetchSuccess).currentPage + 1);
        

        final currentState = (state as StudentsByClassSectionFetchSuccess);
        List<Student> students = currentState.students;

        students.addAll(moreStudents[students]);// TODO: Add ''

        
        emit(StudentsByClassSectionFetchSuccess(
            currentPage: moreStudents['currentPage'],
            fetchMoreError: false,
            fetchMoreInProgress: false,
            totalPage: moreStudents['totalPage'],
            students: students));
         
      } catch (e) {
        emit((state as StudentsByClassSectionFetchSuccess).copyWith(
            fetchMoreInProgress: false, fetchMoreError: true));
      }
    }
  }






}