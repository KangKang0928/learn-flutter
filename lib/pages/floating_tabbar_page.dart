import 'package:flutter/material.dart';

class FloatingTabbarPage extends StatefulWidget {
  const FloatingTabbarPage({Key? key}) : super(key: key);

  @override
  _FloatingTabbarPageState createState() => _FloatingTabbarPageState();
}

class _FloatingTabbarPageState extends State<FloatingTabbarPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeBody(),
    CategoryBody(),
    CategoryBody(),
    SettingsBody(),
    MyBody()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabbar示例"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "发布"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置"),
          BottomNavigationBarItem(icon: Icon(Icons.man), label: "我的")
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          if (value != 2) {
            setState(() {
              _currentIndex = value;
            });
          }
        },
      ),
      //凸起按钮
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        width: 60,
        height: 60,
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton(
          focusElevation:0.0,
          hoverElevation: 0.0,
          backgroundColor:_currentIndex!=2?Colors.grey:Colors.blue,
          elevation: 0,
          onPressed: () {
            setState(() {
              _currentIndex=2;
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
      //偏移凸起按钮至底部
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// 首页
class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("首页"),
    );
  }
}

//分类
class CategoryBody extends StatelessWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("分类"),
    );
  }
}

//设置
class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("设置"));
  }
}

//我的
class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("我的"));
  }
}
