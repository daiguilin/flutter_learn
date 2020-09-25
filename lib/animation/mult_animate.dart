import 'dart:math';
import 'package:flutter/material.dart';

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
  final GlobalKey<_AnimationDemo01State> demo01Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("动画测试"),
      ),
      body: AnimationDemo01(
        key: demo01Key,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: () {
          if (!demo01Key.currentState.controller.isAnimating) {
            demo01Key.currentState.controller.forward();
          } else {
            demo01Key.currentState.controller.stop();
          }
        },
      ),
    );
  }
}

class AnimationDemo01 extends StatefulWidget {
  AnimationDemo01({Key key}) : super(key: key);

  @override
  _AnimationDemo01State createState() => _AnimationDemo01State();
}

class _AnimationDemo01State extends State<AnimationDemo01>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  Animation<Color> colorAnim;
  Animation<double> sizeAnim;
  Animation<double> rotationAnim;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
        );
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    colorAnim = ColorTween(begin: Colors.blue,end: Colors.red).animate(controller);
    sizeAnim  = Tween(begin: 100.0, end: 200.0).animate(controller);
    rotationAnim = Tween(begin: 0.0,end: 2*pi).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
//    print("colorAnim:${colorAnim.value}");
//    print("colorAnim:${colorAnim.value}");
//    print("colorAnim:${colorAnim.value}");
    return Center(
      child: AnimatedBuilder(
        animation: controller,
        builder: (ctx,child){
          return Opacity(
            opacity: animation.value,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationZ(rotationAnim.value),
              child: Container(
                width: sizeAnim.value,
                height: sizeAnim.value,
                color: colorAnim.value,
                alignment: Alignment.center,
              ),
            ),
          );
        },
      )
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
