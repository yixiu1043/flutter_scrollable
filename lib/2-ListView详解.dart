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
      body: Scrollbar(
        /// itemExtent给主轴的每项一个紧约束，如果是主轴是水平方向那么就是宽，
        /// 垂直方向就是高，此时单独设置宽/高是无效的
        child: ListView.builder(
          // physics: ClampingScrollPhysics(),
          // physics: BouncingScrollPhysics(),
          // physics: NeverScrollableScrollPhysics(),
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 22,
          itemExtent: 60, // 给一个
          padding: const EdgeInsets.only(bottom: 100),
          itemBuilder: (context, index) {
            return Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.blue[(index % 5) * 100],
              child: Text('$index'),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
