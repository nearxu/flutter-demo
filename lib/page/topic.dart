import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  Topic({this.arguments});
  final arguments;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("hi this is next page, id is"),
      ),
    );
  }
}
