import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    Widget textArea = Container(
      child: Column(
        children: <Widget>[Text('search page ')],
      ),
    );
    return Scaffold(body: textArea);
  }
}
