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
        body: AnimationDemo01(key: demo01Key,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_filled),
        onPressed: (){
          if(!demo01Key.currentState.controller.isAnimating){
            demo01Key.currentState.controller.forward();
          }else{
            demo01Key.currentState.controller.stop();
          }
        },
      ),
    );
  }
}

class AnimationDemo01 extends StatefulWidget {
  AnimationDemo01({Key key}):super(key:key);
  @override
  _AnimationDemo01State createState() => _AnimationDemo01State();
}

class _AnimationDemo01State extends State<AnimationDemo01> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animation = CurvedAnimation(parent: controller,curve: Curves.elasticInOut,reverseCurve:Curves.easeOut );

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        controller.reverse();
      }else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
    });

    animation = Tween(begin: 50.0,end: 120.0).animate(controller);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder:(ctx,child){
          return Icon(Icons.favorite,color: Colors.red,size: animation.value);
        }
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
