import 'package:flutter/material.dart';

class TestContainer extends StatelessWidget {
  const TestContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration : BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      )
    );
  }
}