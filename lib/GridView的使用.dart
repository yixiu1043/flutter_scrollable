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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      /// 1. 横轴竖轴固定数量
      // body: GridView.builder(
      //   itemCount: 100,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 3,
      //     childAspectRatio: 16 / 9,
      //   ),
      //   itemBuilder: (BuildContext context, int index) {
      //     return Container(
      //       color: Colors.blue[(index % 5) * 100],
      //     );
      //   },
      // ),
      /// 2. 横轴竖轴动态数量
      body: GridView.builder(
        itemCount: 100,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 16 / 9,
          maxCrossAxisExtent: 104,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blue[(index % 5) * 100],
          );
        },
      ),
    );
  }
}
