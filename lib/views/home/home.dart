import 'package:flutter/material.dart';
import 'package:flutter_learn/dash_line.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 1,
        height: 100,
        child: DGLDashedLine(axis:Axis.vertical,dashedWidth:2,dashedHeight:1,count:20),
      ),
    );
  }
}
