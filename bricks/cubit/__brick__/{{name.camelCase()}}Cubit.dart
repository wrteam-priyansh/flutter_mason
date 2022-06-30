
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}


class {{name.pascalCase()}}{{stateType.pascalCase()}}InProgress extends {{name.pascalCase()}}State {}


class {{name.pascalCase()}}{{stateType.pascalCase()}}Success extends {{name.pascalCase()}}State {}


class {{name.pascalCase()}}{{stateType.pascalCase()}}Failure extends {{name.pascalCase()}}State {
  final String errorMessage;

  {{name.pascalCase()}}{{stateType.pascalCase()}}Failure(this.errorMessage);

  
}

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {

  final {{repository.pascalCase()}} _{{repository.camelCase()}};

  {{name.pascalCase()}}Cubit(this._{{repository.camelCase()}}) : super({{name.pascalCase()}}Initial());

}