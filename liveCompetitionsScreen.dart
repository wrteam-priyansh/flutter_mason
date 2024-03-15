import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveCompetitionsScreen extends StatefulWidget {
  LiveCompetitionsScreen({Key? key}) : super(key: key);

  
  static Widget getRouteInstance() => const LiveCompetitionsScreen();

 @override
  State<LiveCompetitionsScreen> createState() => _LiveCompetitionsScreenState();

}

class _LiveCompetitionsScreenState extends State<LiveCompetitionsScreen> {

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body : SizedBox()      
    );
  }
}