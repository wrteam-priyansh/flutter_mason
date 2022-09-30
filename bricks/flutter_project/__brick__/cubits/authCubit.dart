import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class Unauthenticated extends AuthState {}

class Authenticated extends AuthState {
  final String jwtToken;

  Authenticated({required this.jwtToken});
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial()) {
    _checkIsAuthenticated();
  }

  void _checkIsAuthenticated() {
    if (authRepository.getIsLogIn()) {
      emit(
        Authenticated(
          jwtToken: authRepository.getJwtToken(),
        ),
      );
    } else {
      emit(Unauthenticated());
    }
  }

  void authenticateUser({
    required String jwtToken,
  }) {
    //
    authRepository.setJwtToken(jwtToken);
    authRepository.setIsLogIn(true);

    //emit new state
    emit(Authenticated(
      jwtToken: jwtToken,
    ));
  }

  void signOut() {
    authRepository.signOutUser();
    emit(Unauthenticated());
  }
}
