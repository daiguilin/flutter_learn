import 'package:flutter/material.dart';
import 'dart:math';
import 'image_detail.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hero动画"),
      ),
      body: DGLHomeContent()
    );
  }
}

class DGLHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2
      ),
      children: List.generate(20, (index){
        String imageUrl = "https://picsum.photos/id/$index/400/200";
        return GestureDetector(
          onTap:(){
            Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (ctx,animation,animation2){
                return FadeTransition(
                  opacity: animation,
                  child: DGLImageDetail(imageUrl),
                );
              }
            ));
          },
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl),
          ),
        );
      }),
    );
  }
}


