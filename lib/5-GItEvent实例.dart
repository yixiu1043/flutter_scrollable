import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _events = [];

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _getData();
        },
        child: Scrollbar(
          child: ListView(
            children: _events.map<Widget>((event) {
              return Dismissible(
                key: ValueKey(event.id),
                confirmDismiss: (_) async {
                  return showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text('提示'),
                          content: Text('您确定要删除吗？'),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('取消'),
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: Text('确定'),
                            )
                          ],
                        );
                      });
                },
                onDismissed: (_) {
                  setState(() {
                    _events.removeWhere((element) => element.id == event.id);
                  });
                },
                child: ListTile(
                  leading: Image.network(event.avatarUrl),
                  title: Text('${event.userName}'),
                  subtitle: Text('${event.repoName}'),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Future _getData() async {
    var url = Uri.parse('https://api.github.com/events');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      setState(() {
        _events.clear();
        _events.addAll(json.map((element) => GitEvent(element)));
      });
    }
  }
}

class GitEvent {
  String id;
  String avatarUrl;
  String repoName;
  String userName;

  GitEvent(json) {
    this.id = json['id'];
    this.avatarUrl = json['actor']['avatar_url'];
    this.repoName = json['repo']['name'];
    this.userName = json['actor']['login'];
  }

  @override
  String toString() {
    return 'GitEvent{id: $id, avatarUrl: $avatarUrl, repoName: $repoName, userName: $userName}';
  }
}
