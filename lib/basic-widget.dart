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
          body: Center(child: FormDemo()),
        ));
  }
}

//Form表单
class FormDemo extends StatefulWidget {
  @override
  _FormDemoState createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;

  void registerForm() {
    registerFormKey.currentState.save();
    registerFormKey.currentState.validate();

    print("username:$username password:$password");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                icon: Icon(Icons.people), labelText: "username"),
            onSaved: (value) {
              this.username = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return '账号不能为空';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: true, //隐藏密码显示
            decoration:
                InputDecoration(icon: Icon(Icons.lock), labelText: "password"),
            onSaved: (value) {
              this.password = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            height: 44,
            child: RaisedButton(
              color: Colors.lightGreen,
              child: Text(
                "注册",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              onPressed: registerForm,
            ),
          )
        ],
      ),
    );
  }
}

//基础表单内容
class MyHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[TextFieldDemo()],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = "hello world";
    textEditingController.addListener(() {
      print("textEditingController ${textEditingController.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          icon: Icon(Icons.people),
          labelText: "用户名",
          hintText: "请输入用户名",
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.lightGreen),
      onChanged: (value) {
        print("onChanged $value");
      },
      onSubmitted: (value) {
        print("onSubmitted $value");
      },
    );
  }
}

//实现圆角头像方式一（可包含文字）

//class MyHomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: CircleAvatar(
//        radius: 150,
//          backgroundImage:NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
//          child:Container(
//            alignment: Alignment(0,.5),
//            width:300,
//            height: 300,
//            child: Text("兵长利威尔"),
//          )
//      ),
//    );
//  }
//}

//实现圆角头像方式二
//class MyHomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: ClipOval(
//        child: Image.network(
//          "https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg",
//          width: 200,
//          height: 200,
//        ),
//      ),
//    );
//  }
//}

//本地图片加载
//class MyHomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Container(
//        width: 300,
//        height: 300,
//        color: Colors.yellow,
//        child: Image.asset("images/test.jpg"),
//      ),
//    );
//  }
//}

//网络图片加载
//class MyHomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Container(
//        width: 300,
//        height: 300,
//        color: Colors.yellow,
//        child: Image.network(
//          "http://img0.dili360.com/ga/M01/48/3C/wKgBy1kj49qAMVd7ADKmuZ9jug8377.tub.jpg",
//          alignment: Alignment.topCenter,
//          repeat: ImageRepeat.repeatY,
//          color: Colors.red,
//          colorBlendMode: BlendMode.colorDodge,
//        ),
//      ),
//    );
//  }
//}

//按钮组件练习
//class MyHomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        FloatingActionButton(
//          child: Text("FloatingActionButton"),
//          onPressed: () {
//            print("FloatingActionButton Click");
//          },
//        ),
//        RaisedButton(
//          child: Text("RaisedButton"),
//          onPressed: () {
//            print("RaisedButton Click");
//          },
//          elevation:20,//控制按钮阴影大小
////          color: Colors.orange,
////          highlightColor: Colors.orange[700],//按下去高亮颜色
////          shape:
////              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),// 圆角的实现
//        ),
//        FlatButton(
//          child: Text("FlatButton"),
//          onPressed: () {
//            print("FlatButton Click");
//          },
//        ),
//        OutlineButton(
//          child: Text("OutlineButton"),
//          onPressed: () {
//            print("OutlineButton Click");
//          },
//        )
//      ],
//    );
//  }
//}

//富文本展示
//class MyHomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Text.rich(
//        TextSpan(
//          children: [
//            TextSpan(
//                text: "《定风波》",
//                style: TextStyle(
//                    fontSize: 25,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black)),
//            TextSpan(
//                text: " 苏轼",
//                style: TextStyle(fontSize: 18, color: Colors.redAccent)),
//            TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
//          ],
//          style: TextStyle(fontSize: 20, color: Colors.purple),
//        ),
//        textAlign: TextAlign.center);
//  }
//}

//普通文本展示
//class MyHomeBody extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Text(
//      "《定风波》 苏轼 \n莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
//      textAlign: TextAlign.center,
//      maxLines: 2,
//      overflow: TextOverflow.ellipsis,
//      textScaleFactor: 1.24,
//      style: TextStyle(fontSize: 20, color: Colors.purple),
//    );
//  }
//}
