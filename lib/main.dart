import 'dart:math';
import './pages/snowman.dart';
import './pages/ball.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Card> menus = [
    Card(
        "雪人",
        const SnowManPage(
          title: '雪人',
        )),
    Card("3d球球", const BallPage()),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: menus.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                  onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return menus[index].widget;
                        }))
                      },
                  child: Text(menus[index].cardName));
            }));
  }
}

//每个菜单
class Card {
  //名字
  late String cardName;
  //跳转的路由
  late String routeName;
  //跳转的页面组件
  late Widget widget;
  Card(this.cardName, this.widget);
}
