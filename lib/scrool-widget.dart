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
          body: Center(child: Home()),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _progress = 0;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        //1.判断监听事件的类型
        if (notification is ScrollStartNotification) {
          print("开始滚动.....");
        } else if (notification is ScrollUpdateNotification) {
          final currentPixel = notification.metrics.pixels;
          final totalPixel = notification.metrics.maxScrollExtent;
          double progress = currentPixel / totalPixel;
          setState(() {
            _progress = (progress * 100).toInt();
          });
          print(
              "正在滚动：${notification.metrics.pixels} - ${notification.metrics.maxScrollExtent}");
        } else if (notification is ScrollEndNotification) {
          print("结束滚动....");
        }
        return false;
      },
      child: Stack(
        alignment: Alignment(.9, .9),
        children: <Widget>[
          ListView.builder(
              itemCount: 100,
              itemExtent: 60,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text("item$index"),);
              }),
          CircleAvatar(
            radius: 30,
            child: Text("$_progress%"),
            backgroundColor: Colors.black54,
          )
        ],
      ),
    );
  }
}

//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}

//class _HomeState extends State<Home> {
//  ScrollController _controller;
//  bool _isShopTop = false;
//
//  @override
//  void initState() {
//    _controller = ScrollController();
//
//    //监听
//    _controller.addListener(() {
//      var tempSsShowTop = _controller.offset >= 1000;
//      if (tempSsShowTop != _isShopTop) {
//        setState(() {
//          _isShopTop = tempSsShowTop;
//        });
//      }
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: AppBar(
//          title: Text('listview展示'),
//        ),
//        body: ListView.builder(
//          itemCount: 100,
//          itemExtent: 60,
//          controller: _controller,
//          itemBuilder: (BuildContext context, int index) {
//            return ListTile(title: Text("item $index"),);
//          },
//         ),
//        floatingActionButton: !_isShopTop ? null : FloatingActionButton(
//          child: Icon(Icons.arrow_upward),
//          onPressed: () {
//            _controller.animateTo(
//                0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
//          },
//        )
//    );
//  }
//}

//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return showCustomScrollView();
//  }
//
//  Widget showCustomScrollView() {
//    return new CustomScrollView(
//      slivers: <Widget>[
//        const SliverAppBar(
//          expandedHeight: 250.0,
//          flexibleSpace: FlexibleSpaceBar(
//            title: Text('codewhy demo'),
//            background: Image(
//              image: NetworkImage(
//                "https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg",
//              ),
//              fit: BoxFit.cover,
//            ),
//          ),
//        ),
//        new SliverGrid(
//            delegate: new SliverChildBuilderDelegate(
//                (BuildContext context, int index) {
//              return new Container(
//                alignment: Alignment.center,
//                color: Colors.teal[100 * (index % 9)],
//                child: new Text('grid item $index'),
//              );
//            },childCount: 10),
//            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
//                maxCrossAxisExtent: 200.0,
//                mainAxisSpacing: 10.0,
//                crossAxisSpacing: 10.0,
//                childAspectRatio: 4.0)),
//        SliverFixedExtentList(delegate: SliverChildBuilderDelegate(
//            (BuildContext content,int index){
//              return new Container(
//                alignment:Alignment.center,
//                color:Colors.lightGreen[100*(index%9)],
//                child:new Text("list item $index")
//              );
//            },
//          childCount: 20
//        ), itemExtent: 50.0)
//      ],
//    );
//  }
//}

//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return CustomScrollView(
//      slivers: <Widget>[
//        SliverSafeArea(
//          sliver: SliverPadding(
//            padding: EdgeInsets.all(8),
//            sliver: SliverGrid(
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//                crossAxisSpacing: 10,
//                mainAxisSpacing: 10
//              ),
//              delegate: SliverChildBuilderDelegate(
//                  (BuildContext context,int index){
//                    return Container(
//                      alignment: Alignment(0, 0),
//                      color: Colors.orange,
//                      child: Text("item$index"),
//                    );
//                  },
//                childCount: 20
//              ),
//            ),
//          ),
//        )
//      ],
//    );
//  }
//}

//SliverGridDelegateWithFixedCrossAxisCount,SliverGridDelegateWithMaxCrossAxisExtent使用
//class Home extends StatelessWidget {
//  List<Widget> getGridWidgets() {
//    return List.generate(30, (index) {
//      return Container(
//        color: Colors.purple,
//        alignment: Alignment(0, 0),
//        child: Text("item$index", style: TextStyle(fontSize: 20, color: Colors.white)),
//      );
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    return GridView(
////      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////        crossAxisCount: 3,
////        mainAxisSpacing: 10,
////        crossAxisSpacing: 18,
////        childAspectRatio: 1.5
////      ),
//        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
//          maxCrossAxisExtent: 100,
//          mainAxisSpacing: 10,
//          crossAxisSpacing: 10,
//            childAspectRatio: 1.0
//        ),
//      children: getGridWidgets(),
//    );
//  }
//}

//separated
//class Home extends StatelessWidget {
//  Divider blueColor = Divider(
//    color: Colors.blue,
//  );
//  Divider redColor = Divider(
//    color: Colors.red,
//  );
//
//  @override
//  Widget build(BuildContext context) {
//    return ListView.separated(
//        itemBuilder: (BuildContext context, int index) {
//          return ListTile(
//            leading: Icon(Icons.people),
//            title: Text("联系人${index + 1}"),
//            subtitle: Text("联系人电话${index + 1}"),
//          );
//        },
//        separatorBuilder: (BuildContext context, int index) {
//          return index % 2 == 0 ? redColor : blueColor;
//        },
//        itemCount: 100);
//  }
//}

//ListView.builder
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView.builder(
//        itemCount: 50,
//        itemExtent: 80,
//        itemBuilder: (BuildContext context, int index) {
//          return ListTile(
//            title: Text("标题$index"),
//            subtitle: Text("详情内容$index"),
//          );
//        });
//  }
//}

//scrollDirection
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      scrollDirection: Axis.horizontal,
//      itemExtent: 200,
//      children: <Widget>[
//        Container(color: Colors.red,width: 200,),
//        Container(color: Colors.green,width: 200,),
//        Container(color: Colors.blue,width: 200,),
//        Container(color: Colors.purple,width: 200,),
//        Container(color: Colors.orange,width: 200,),
//      ],
//    );
//  }
//}

//ListTile基本使用
//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
//        ListTile(
//          leading: Icon(Icons.people,size: 36,),
//          title: Text('联系人'),
//          subtitle: Text('联系人信息'),
//          trailing: Icon(Icons.arrow_forward_ios),
//        ),
//        ListTile(
//          leading: Icon(Icons.email, size: 36,),
//          title: Text("邮箱"),
//          subtitle: Text("邮箱地址信息"),
//          trailing: Icon(Icons.arrow_forward_ios),
//        ),
//        ListTile(
//          leading: Icon(Icons.message, size: 36,),
//          title: Text("消息"),
//          subtitle: Text("消息详情信息"),
//          trailing: Icon(Icons.arrow_forward_ios),
//        ),
//        ListTile(
//          leading: Icon(Icons.map, size: 36,),
//          title: Text("地址"),
//          subtitle: Text("地址详情信息"),
//          trailing: Icon(Icons.arrow_forward_ios),
//        )
//      ],
//    );
//  }
//}

//ListView基本使用
//class Home extends StatelessWidget {
//  final TextStyle textStyle =TextStyle(fontSize: 20,color: Colors.redAccent);
//  @override
//  Widget build(BuildContext context) {
//    return ListView(
//      children: <Widget>[
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Text("人的一切痛苦，本质上都是对自己无能的愤怒。", style: textStyle),
//        ),
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Text("人活在世界上，不可以有偏差；而且多少要费点劲儿，才能把自己保持到理性的轨道上。", style: textStyle),
//        ),
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Text("我活在世上，无非想要明白些道理，遇见些有趣的事。", style: textStyle),
//        )
//
//      ],
//    );
//  }
//}
