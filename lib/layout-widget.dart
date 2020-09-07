import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: Scaffold(
          appBar: AppBar(
            title: Text("stateFulWidget练习"),
          ),
          body: Center(child: Demo()),
        ));
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 300,
          height: 300,
          color: Colors.purple,
        ),
        Positioned(
          left: 20,
          top: 20,
          child: Icon(
            Icons.favorite,
            size: 50,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Text("你好啊，李银河",
              style: TextStyle(fontSize: 20, color: Colors.white)),
        )
      ],
    );
  }
}

//BoxDecoration
//class Demo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 200,
//      height: 200,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(20),
//        image: DecorationImage(
//          image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg")
//        )
//      ),
//    );
//  }
//}

//BoxDecoration
//class Demo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: 150,
//      height: 150,
//      child: Icon(
//        Icons.pets,
//        size: 36,
//        color: Colors.white,
//      ),
//      decoration: BoxDecoration(
//          color: Colors.amber,
//          border: Border.all(
//              color: Colors.greenAccent, width: 3, style: BorderStyle.solid),
////        borderRadius: BorderRadius.circular(20),
//          shape: BoxShape.circle, // 会和borderRadius冲突
//          boxShadow: [
//            BoxShadow(offset: Offset(5, 5), color: Colors.purple, blurRadius: 5)
//          ],
//        gradient: LinearGradient(
//          colors: [
//            Colors.green,
//            Colors.red
//          ]
//        )
//      )
//    );
//  }
//}

//Container
//class Demo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      color: Color.fromRGBO(3, 3, 255, .5),
//      height: 100,
//      width: 100,
//      child: Icon(Icons.pets,size: 36,color: Colors.white,),
//    );
//  }
//}

//class Demo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: EdgeInsets.all(20),
//        child: Text(
//          "莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
//          style: TextStyle(
//              color: Colors.redAccent,
//              fontSize: 18
//          ),
//        )
//    );
//  }
//}

//Align组件
//class Demo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Icon(Icons.pets,size: 36,color: Colors.red,),
//      widthFactor: 3,
//      heightFactor:3,
//    );
//  }
//}
