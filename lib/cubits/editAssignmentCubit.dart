import 'package:flutter_bloc/flutter_bloc.dart';

abstract class EditAssignmentState {}

class EditAssignmentInitial extends EditAssignmentState {}

class EditAssignmentInProgress extends EditAssignmentState {}

class EditAssignmentSuccess extends EditAssignmentState {}

class EditAssignmentFailure extends EditAssignmentState {
  final String errorMessage;

  EditAssignmentFailure(this.errorMessage);
}

class EditAssignmentCubit extends Cubit<EditAssignmentState> {
  final AssignmentRepository _assignmentRepository;

  EditAssignmentCubit(this._assignmentRepository)
      : super(EditAssignmentInitial());
}
