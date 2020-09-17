import 'package:flutter/material.dart';
import 'package:flutter_learn/state_manage/main_InheritedWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DGLHomePage(),
    );
  }
}

class DGLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("手势识别"),
        ),
        body: Center(
          child: GestureDetector(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.redAccent,
              ),
            onTap: () {},
            onTapDown: (details) {
              print(details.globalPosition);
              print(details.localPosition);
            },
            onTapUp: (details) {
//              print(details.globalPosition);
//              print(details.localPosition);
            },
          ),
        ));
  }
}
//class DGLHomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Listener(
//        child: Container(
//          width: 200,
//          height: 200,
//          color: Colors.red,
//        ),
//        onPointerDown: (event) => print("手指按下:$event"),
//        onPointerMove: (event) => print("手指移动:$event"),
//        onPointerUp: (event) => print("手指抬起:$event"),
//      ),
//    );
//  }
//}
