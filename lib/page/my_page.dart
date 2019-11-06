import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    Widget textArea = Container(
      child: Column(
        children: <Widget>[Text('my page ')],
      ),
    );
    return Scaffold(body: textArea);
  }
}
