import 'package:flutter/material.dart';
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar:BottomNavigationBar(
            currentIndex:_currentIndex,
            selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: [],
        )
    );
  }
}
