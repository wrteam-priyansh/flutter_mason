import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({Key? key}) : super(key: key);

  static Route<dynamic> route(RouteSettings routeSettings) {
    return CupertinoPageRoute(
        builder: (_) =>
            MultiBlocProvider(providers: [], child: const AssignmentScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
