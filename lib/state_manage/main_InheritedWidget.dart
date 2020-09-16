import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

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

class DGLHomePage extends StatefulWidget {
  @override
  _DGLHomePageState createState() => _DGLHomePageState();
}

class _DGLHomePageState extends State<DGLHomePage> {
  int data = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: DGLDataWidget(
        counter: data,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DGLShowData1(),
                DGLShowData2(),
              ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          setState(() {
            data++;
          });
        },
      ),
    );
  }
}

class DGLDataWidget extends InheritedWidget{
  final int counter;
  DGLDataWidget({this.counter,Widget child}):super(child:child);

  static DGLDataWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType();
  }
  @override
  bool updateShouldNotify(DGLDataWidget oldWidget) {
    return this.counter != oldWidget.counter;
  }
}

class DGLShowData1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("当前数字：${DGLDataWidget.of(context).counter}"),
    );
  }
}
class DGLShowData2 extends StatefulWidget {
  @override
  _DGLShowData2State createState() => _DGLShowData2State();
}

class _DGLShowData2State extends State<DGLShowData2> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("当前数字：${DGLDataWidget.of(context).counter}"),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
