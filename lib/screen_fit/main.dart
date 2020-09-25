import 'dart:ui';

import 'package:flutter/material.dart';
//import 'screen.dart';
import '../extension/int_extension.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "home",
      home: DGLHomeContent(),
    );
  }
}
class DGLHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    //获取屏幕宽度和高度
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;

    //状态栏
    final statusBarHeight=mediaQueryData.padding.top;
    final bottomHeight = mediaQueryData.padding.bottom;

//    print("状态栏height: $statusBarHeight 底部高度:$bottomHeight");

//    print("screenWidth:$screenWidth screenHeight:$screenHeight");
//    print("physicalWidth:$physicalWidth physicalHeight:$physicalHeight");
//    DGLSizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("测试"),
      ),
      body: Center(
        child: Container(
            width: 200.px,
            height: 400.rpx,
            color: Colors.red,
            alignment: Alignment.center,
            child: Text("Hello World11", style: TextStyle(fontSize: 30.px, color: Colors.white),)
        ),
      ),
    );
  }
}

