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
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.green,
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Icon(Icons.phone),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              padding: EdgeInsets.only(right: 24),
              alignment: Alignment.centerRight,
              child: Icon(Icons.sms),
            ),
            onDismissed: (DismissDirection direction) {
              print(direction);
              switch (direction) {
                case DismissDirection.vertical:
                  // TODO: Handle this case.
                  break;
                case DismissDirection.horizontal:
                  // TODO: Handle this case.
                  break;
                case DismissDirection.endToStart:
                  // TODO: Handle this case.
                  break;
                case DismissDirection.startToEnd:
                  // TODO: Handle this case.
                  break;
                case DismissDirection.up:
                  // TODO: Handle this case.
                  break;
                case DismissDirection.down:
                  // TODO: Handle this case.
                  break;
                case DismissDirection.none:
                  // TODO: Handle this case.
                  break;
              }
            },

            /// 确定是否删除
            confirmDismiss: (DismissDirection direction) async {
              await Future.delayed(Duration(seconds: 2));
              return true;
            },
            onResize: () {
              print('on resize');
            },
            resizeDuration: Duration(seconds: 5),
            movementDuration: Duration(seconds: 5),
            dismissThresholds: {
              DismissDirection.startToEnd: 0.1,
              DismissDirection.endToStart: 1.0,
            },
            child: Container(
              height: 100,
              alignment: Alignment.center,
              color: Colors.blue[(index % 5) * 100],
              child: Text('$index'),
            ),
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
