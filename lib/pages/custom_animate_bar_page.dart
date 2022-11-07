import 'package:flutter/material.dart';

import '../widget/custom_tabbar.dart';

class CustomAnimateBarPage extends StatefulWidget {
  const CustomAnimateBarPage({Key? key}) : super(key: key);

  @override
  _CustomAnimateBarPageState createState() => _CustomAnimateBarPageState();
}

class _CustomAnimateBarPageState extends State<CustomAnimateBarPage> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;

  Color backgroundColor = const Color(0xff050B18);

  List<String> titles = ['首页', '搜索', '排名', '直播'];
  List<String> bodyImages = [
    'assets/images/body_home.png',
    'assets/images/bo'
        'dy_search.png',
    'assets/images/body_rank.png',
    'assets/images/body_video.png'
  ];

  // ignore: unused_field
  List<Widget>? _pages;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("自定义的底部导航栏"),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          child: Text(titles[_currentIndex],key:UniqueKey()),
        ),
        bottomNavigationBar: CustomAnimatedBottomBar(
          containerHeight: 56,
          backgroundColor: backgroundColor,
          selectedIndex: _currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeInOut,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <MyBottomNavigationBarItem>[
            MyBottomNavigationBarItem(
              icon: const Icon(Icons.home),
              title: Text(titles[0]),
              activeColor: const Color(0xffF4D144),
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            MyBottomNavigationBarItem(
              icon: const Icon(Icons.search),
              title: Text(titles[1]),
              activeColor: Colors.greenAccent,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            MyBottomNavigationBarItem(
              icon: const Icon(Icons.apps),
              title: Text(
                titles[2],
              ),
              activeColor: Colors.pink,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
            MyBottomNavigationBarItem(
              icon: const Icon(Icons.video_camera_front),
              title: Text(titles[3]),
              activeColor: Colors.blue,
              inactiveColor: _inactiveColor,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
