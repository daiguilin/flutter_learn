import 'package:flutter/material.dart';
import 'package:flutter_learn/router/detail.dart';
import 'package:flutter_learn/router/about.dart';
import 'unknow_page.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        DGLHomePage.routeName: (ctx) => DGLHomePage(),
        DGLAboutPage.routeName: (ctx) => DGLAboutPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "/detail") {
          return MaterialPageRoute(
              builder: (ctx) {
                return DGLDetailPage(settings.arguments);
              }
          );
        }
        return null;
      },
        onUnknownRoute:(setting){
          return MaterialPageRoute(
              builder: (ctx) {
                return UnknownPage();
              }
          );
        }
    );
  }
}

class DGLHomePage extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Column(
            children: <Widget>[
              RaisedButton(
                child: Text("跳转详情"),
                onPressed: () => _jumpToDetail(context),
              ),
              RaisedButton(
                child: Text("关于"),
                onPressed: () => _jumpToAbout(context),
              ),
              RaisedButton(
                child: Text("打开未知页面"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/abc");
                },
              )
            ]
        ));
  }

  _jumpToDetail(BuildContext context) {
//    Future result = Navigator.of(context).push(MaterialPageRoute(
//        builder: (ctx) {
//          return DGLDetailPage("a message");
//        }
//    ));
//    result.then((res) {
//      print(res);
//    });
    Navigator.of(context).pushNamed(
        DGLDetailPage.routeName, arguments: "a home message -> detail");
  }

  _jumpToAbout(BuildContext context) {
    Navigator.of(context).pushNamed(
        DGLAboutPage.routeName, arguments: "a home message -> about");
  }
}


