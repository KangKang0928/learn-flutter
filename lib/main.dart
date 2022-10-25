import 'dart:math';
import './pages/snowman.dart';
import './pages/ball.dart';
import './pages/hero动画/first.dart';
import './pages/MusicStore/index.dart';
import './pages/list_view.dart';
import './pages/dynamic_list_view.dart';
import './pages/builder_list_view.dart';
import './pages/grid_view.dart';
import './pages/builder_grid_view.dart';
import './pages/layout_box.dart';
import './pages/stack.dart';
import './pages/stack_position.dart';
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
      home: const MyHomePage(title: 'Flutter'),
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
    Card("Hero动画", const FirtsPage()),
    Card("B&O", const MusicStorePage()),
    Card("ListView列表",const ListViewPage()),
    Card("动态ListView",const DynamicListViewPage()),
    Card("动态BuilderListView",const BuilderListView()),
    Card("动态GridView",const GridViewPage()),
    Card("使用builder的GridView",const BuilderGridViewPage()),
    Card("各种布局实验",const LayoutBoxPage()),
    Card("Stack布局",const StackPage()),
    Card("Stack+Position实现绝对定位布局",const StackPositionPage())
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
            physics:const BouncingScrollPhysics(),
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
