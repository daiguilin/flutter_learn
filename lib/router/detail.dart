import 'package:flutter/material.dart';

class DGLDetailPage extends StatelessWidget {
  static const String routeName = "/detail";
  String message;
  DGLDetailPage(this.message);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        _backHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              RaisedButton(
                child: Text("返回"),
                onPressed: ()=>_backHome(context),
              ),
              Text("$message")
            ]
          ),
        ),
      ),
    );
  }

  _backHome(BuildContext context){
    Navigator.of(context).pop("详情页返回数据");
  }
}
