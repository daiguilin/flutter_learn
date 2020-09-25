import 'package:flutter/material.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "主题",
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        primaryColor: Colors.pink,
        accentColor: Colors.orange,
        cardTheme: CardTheme(
          color: Colors.greenAccent,
          elevation: 10,
          shape: Border.all(width: 3,color: Colors.red),
          margin: EdgeInsets.all(10)
        ),
        buttonTheme: ButtonThemeData(
          minWidth: 0,
          height: 25
        ),
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 30,
            color: Colors.blue
          ),
          display1: TextStyle(fontSize: 10)
        )
      ),
      home: DGLHomePage(),
    );
  }
}

class DGLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画测试"),
      ),
      body:Column(
        children: <Widget>[
          Text("测试文本"),
          RaisedButton(
            child: Text("按钮"),
          ),
          Icon(
            Icons.home
          )
        ],
      )
    );
  }
}


