import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: Scaffold(
          appBar: AppBar(
            title: Text("stateFulWidget练习"),
          ),
          body: Center(child: MyStatefulWidget()),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget() {
    print("执行了MyStatefulWidget的构造方法");
  }

  @override
  State<StatefulWidget> createState() {
    print("执行了MyStatefulWidget的createState方法");
    return MyState();
  }
}

class MyState extends State<MyStatefulWidget> {
  int num = 0;

  MyState() {
    print("执行MyState的构造方法");
  }

  @override
  void initState() {
    super.initState();
    print("执行MyState的init方法");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("执行MyState的didChangeDependencies方法");
  }

  @override
  void didUpdateWidget(MyStatefulWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("执行MyState的didUpdateWidget方法");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("执行MyState的dispose方法");
  }

  @override
  Widget build(BuildContext context) {
    print("执行执行MyState的build方法");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "计数器值：$num",
          style: TextStyle(fontSize: 24, color: Colors.orange),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("+1"),
                onPressed: () {
                  setState(() {
                    num++;
                  });
                }),
            RaisedButton(
                child: Text("-1"),
                onPressed: () {
                  if (num != 0) {
                    setState(() {
                      num--;
                    });
                  }
                }),
          ],
        )
      ],
    );
  }
}
