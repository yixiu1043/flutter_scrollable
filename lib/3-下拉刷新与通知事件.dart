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
  final _controller = ScrollController();

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

      /// 永远显示滚动条
      // body: Scrollbar(
      //   isAlwaysShown: true,
      //   controller: _controller,
      //   child: ListView.builder(
      //     controller: _controller,
      //     itemCount: 200,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         height: 100,
      //         alignment: Alignment.center,
      //         color: Colors.blue[(index % 5) * 100],
      //         child: Text('$index'),
      //       );
      //     },
      //   ),
      // ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 2));
        },
        child: Scrollbar(
          child: NotificationListener(
            onNotification: (ScrollNotification event) {
              print(event);
              /// true 不向上传递事件，下拉刷新就失效了，false继续向上传递事件
              return false;
            },
            child: ListView.builder(
              itemCount: 200,
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
