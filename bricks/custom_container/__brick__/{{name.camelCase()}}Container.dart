import 'package:flutter/material.dart';

class {{name.pascalCase()}}Container extends StatelessWidget {
  const {{name.pascalCase()}}Container({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration : BoxDecoration(
        borderRadius: BorderRadius.circular({{borderRadius}})
      )
    );
  }
}