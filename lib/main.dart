import 'package:flutter/material.dart';
import 'views/home/home.dart';
import 'views/subject/subject.dart';
import 'views/group/group.dart';
import 'views/mall/mall.dart';
import 'views/profile/profile.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        home: App());
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
//      selectedFontSize: 14,
//      unselectedFontSize: 14,
      type: BottomNavigationBarType.fixed,
      items: [
        createItem("home", "首页"),
        createItem("subject", "书影音"),
        createItem("group", "小组"),
        createItem("mall", "市集"),
        createItem("profile", "我的"),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),body: IndexedStack(
      index: _currentIndex,
      children: <Widget>[
        Home(),
        Subject(),
        Group(),
        Mall(),
        Profile()
      ],
    ),);
  }

  BottomNavigationBarItem createItem(String iconName, String title) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          "assets/images/tabbar/$iconName.png",
          width: 30,
        ),
        activeIcon: Image.asset(
          "assets/images/tabbar/${iconName}_active.png",
          width: 30,
        ),
        title: Text(title));
  }
}
