import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      /// 1. 按需加载的，有一个缓冲区域
      /// 2. 动态加载与回收
      // body: ListView.builder(
      //   itemCount: 22,
      //   cacheExtent: 0, // 不缓冲
      //   itemBuilder: (context, index) {
      //     return Container(
      //       height: 60,
      //       alignment: Alignment.center,
      //       color: Colors.blue[(index % 5) * 100],
      //       child: Text('$index'),
      //     );
      //   },
      // ),
      body: ListView.separated(
        itemCount: 6,
        cacheExtent: 0, // 不缓冲
        separatorBuilder: (context, index) {
          return Divider(thickness: 2,);
        },
        itemBuilder: (context, index) {
          return Container(
            height: 60,
            alignment: Alignment.center,
            color: Colors.blue[(index % 5) * 100],
            child: Text('$index'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
