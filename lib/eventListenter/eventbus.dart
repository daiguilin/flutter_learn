import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

void main() => runApp(MyApp());

class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}

final eventBus = EventBus();

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
          child: Column(
            children: <Widget>[
              DGLButton(),
              DGLText()
            ],
          ),
        ));
  }
}

class DGLButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.red,
      highlightColor:Colors.lightGreen,
      child: Text("DGLButton",style: TextStyle(color: Colors.white),),
      onPressed: () {
        final info = UserInfo("why", 18);
        eventBus.fire(info);
      },
    );
  }
}

class DGLText extends StatefulWidget {
  @override
  _DGLTextState createState() => _DGLTextState();
}

class _DGLTextState extends State<DGLText> {
  String message = "Hello CoderWhy";

  @override
  void initState() {
    super.initState();
    eventBus.on<UserInfo>().listen((data) {
      setState(() {
        message = "${data.nickname}-${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("内容显示：$message"),
    );
  }
}
