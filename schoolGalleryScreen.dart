import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolGalleryScreen extends StatefulWidget {
  SchoolGalleryScreen({Key? key}) : super(key: key);

  
  static Widget getRouteInstance() => const SchoolGalleryScreen();

 @override
  State<SchoolGalleryScreen> createState() => _SchoolGalleryScreenState();

}

class _SchoolGalleryScreenState extends State<SchoolGalleryScreen> {

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body : SizedBox()      
    );
  }
}