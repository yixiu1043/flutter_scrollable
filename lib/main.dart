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

      /// 1. ListWheelScrollView
      // body: ListWheelScrollView(
      //   itemExtent: 100,
      //   // offAxisFraction: -1.5,
      //   // diameterRatio: 0.8,
      //   overAndUnderCenterOpacity: 0.5,
      //   magnification: 1.5,
      //   // useMagnifier: true,
      //   physics: FixedExtentScrollPhysics(),
      //   onSelectedItemChanged: (index) => print('selected: $index'),
      //   children: List.generate(
      //     100,
      //     (index) => Container(
      //       color: Colors.blue,
      //       alignment: Alignment.center,
      //       child: Text('$index: Hello'),
      //     ),
      //   ),
      // ),
      /// 2. PageView
      // body: PageView(
      //   // pageSnapping: false,
      //   scrollDirection: Axis.horizontal,
      //   children: [
      //     Container(color: Colors.blue),
      //     Container(color: Colors.orange),
      //   ],
      //   onPageChanged: (index) => print('selected $index'),
      // ),
      /// 3. ReorderableListView 可拖拽
      body: ReorderableListView(
        header: Container(
          alignment: Alignment.center,
          child: Text('header'),
        ),
        onReorder: (int oldIndex, int newIndex) {
          print('moved from $oldIndex to $newIndex');
        },
        children: List.generate(
          20,
          (index) => Container(
            key: UniqueKey(),
            height: 30,
            color: Colors.blue[(index % 5) * 100],
            alignment: Alignment.center,
            child: Text(
              'index is $index',
            ),
          ),
        ),
      ),
    );
  }
}
