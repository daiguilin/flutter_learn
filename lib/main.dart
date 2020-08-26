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
          body: Center(child: MyStatefulWidget()),
        ));
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyState();
  }
}

class MyState extends State<MyStatefulWidget> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("计数器值：$num",style: TextStyle(fontSize:24,color: Colors.orange),),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("+1"),
                onPressed: () {
                  setState(() {
                    num++;
                  });
                }),
            RaisedButton(
                child: Text("-1"),
                onPressed: () {
                  if(num!=0){
                    setState(() {
                      num--;
                    });
                  }

                }),
          ],
        )
      ],
    );
  }
}
