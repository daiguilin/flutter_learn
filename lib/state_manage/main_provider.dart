import 'package:flutter/material.dart';
import 'package:flutter_learn/app.dart';
import 'package:provider/provider.dart';

void main() =>
    runApp(ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent),
        home: DGLHomePage());
  }
}

class DGLHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("provider")
        ),
        body: Center(
            child: Consumer<CounterProvider>(
              builder: (ctx, counterPro, child) {
                return Text("当前计数：${counterPro.counter}");
              },
            ),
        ),
      floatingActionButton: Consumer<CounterProvider>(
        builder: (ctx,counterPro,child){
          return FloatingActionButton(
            child: child,
            onPressed: (){
              counterPro.counter+=1;
            },
          );
        },
          child:Icon(Icons.add)
      ),
    );
  }
}

class CounterProvider extends ChangeNotifier {
  int _counter = 100;

  int get counter {
    return _counter;
  }

  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}
