import 'package:flutter/material.dart';

class DGLAboutPage extends StatelessWidget {
  static const String routeName = "/about";
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("关于"),
      ),
      body: Center(
        child: Text("$message")
      ),
    );
  }

}
