import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_demo/page/topic.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CNode",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {"/": (context) => Home(), "/Topic": (context) => Topic()},
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("CNode - Node.js专业中文社区"),
        ),
        body: Container(
          child: HomeList(),
          // child: Center(
          //   child: CircularProgressIndicator(),
          // )
        ));
  }
}

class HomeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeList> {
  int _page = 1;
  var _res = [];
  var _client = new http.Client();
  @override
  initState() {
    super.initState();
    fetchHomeData();
  }

  fetchHomeData() async {
    String _homeurl =
        "https://cnodejs.org/api/v1/topics?page=${_page.toString()}";
    http.Response response = await _client.get(_homeurl);
    if (response.statusCode == 200) {
      var respoensBody = jsonDecode(response.body);
      if (respoensBody['success']) {
        setState(() {
          _res.addAll(respoensBody['data']);
        });
        print("http ok -- ${_page.toString()}");
      } else {
        print("api error");
      }
    } else {
      print("http Error");
    }
  }

  Widget _itemBuild(BuildContext context, int index) {
    if (index == _res.length) {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
          ),
        ),
      );
    }

    var _item = _res[index];
    var _tabText = {
      "ask": "问答",
      "share": "分享",
      "job": "招聘",
      "good": "赞",
      "--": "奇怪的内容"
    };

    if (index >= _res.length - 1) {
      _page++;
      fetchHomeData();
    }

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/Topic", arguments: _item),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.fromLTRB(6, 5, 6, 2),
        padding: EdgeInsets.all(10),
        height: 60,
        child: Row(
          children: <Widget>[
            Image.network(_item['author']['avatar_url']),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(const Radius.circular(2))),
              padding: EdgeInsets.fromLTRB(3, 0, 3, 0),
              child: Text(
                _item['top'] ? "置顶" : _tabText[_item['tab']],
                style: TextStyle(color: Colors.grey[500], fontSize: 13),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: 210,
              child: Text(
                _item['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _res.length + 1,
      itemBuilder: _itemBuild,
    );
  }
}
