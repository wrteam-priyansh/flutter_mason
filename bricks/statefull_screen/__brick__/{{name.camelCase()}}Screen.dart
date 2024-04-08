import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{name.pascalCase()}}Screen extends StatefulWidget {
  {{name.pascalCase()}}Screen({Key? key}) : super(key: key);

  
  static Widget getRouteInstance() {
    final arguments = Get.arguments as Map<String,dynamic>;
    return const {{name.pascalCase()}}Screen();
  };


  static Map<String, dynamic> buildArguments() {
    return {};
  }

 @override
  State<{{name.pascalCase()}}Screen> createState() => _{{name.pascalCase()}}ScreenState();

}

class _{{name.pascalCase()}}ScreenState extends State<{{name.pascalCase()}}Screen> {

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body : SizedBox()      
    );
  }
}