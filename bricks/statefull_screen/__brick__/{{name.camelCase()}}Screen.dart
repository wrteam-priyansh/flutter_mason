import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class {{name.pascalCase()}}Screen extends StatefulWidget {
  {{name.pascalCase()}}Screen({Key? key}) : super(key: key);

  
  static Route<dynamic> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(builder: (_) => MultiBlocProvider(providers: [], child: const {{name.pascalCase()}}Screen()));
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