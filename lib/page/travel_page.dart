import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    Widget textArea = Container(
      child: Column(
        children: <Widget>[Text('travel page ')],
      ),
    );
    return Scaffold(body: textArea);
  }
}
