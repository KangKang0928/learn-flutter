import 'package:flutter/material.dart';
import 'dart:async';

// ignore: must_be_immutable
class MySwiper extends StatefulWidget {

  //轮播方向
  Axis scrollDirection;
  //轮播内容
  List<Widget> children;
  //轮播图高度
  double width;
  //轮播图宽度
  double height;
  //底部指示器的高度
  double indicator;
  //底部指示器active颜色
  Color activedIndicatorColor;
  //底部指示器非激活状态的颜色
  Color inactiveIndicatorColor;
  //是否自动轮播
  bool autoplay;
  //自动轮播间隔时长,单位：ms
  int interval;
  //轮播图滚动时长
  int duration;

  MySwiper(
      {Key? key,
      this.scrollDirection = Axis.horizontal,
      required this.children,
      this.width = 400.0,
      this.height = 200.0,
      this.indicator = 40.0,
      this.activedIndicatorColor = Colors.blue,
      this.inactiveIndicatorColor = Colors.white,
      this.autoplay = true,
      this.interval = 3000,
      this.duration = 1000})
      : super(key: key);

  @override
  _MySwiperState createState() => _MySwiperState();
}

class _MySwiperState extends State<MySwiper> with AutomaticKeepAliveClientMixin{
  int _currentIndex = 0;
  late PageController _controller;
  late Timer _timer;

  void _onPageChanged(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget dots() {
    List<Widget> _dots = [];

    for (int index = 0; index < widget.children.length; index++) {
      _dots.add(Container(
        margin: const EdgeInsets.fromLTRB(3, 0, 3, 0),
        decoration: BoxDecoration(
            color: _currentIndex == index
                ? widget.activedIndicatorColor
                : widget.inactiveIndicatorColor,
            borderRadius: BorderRadius.circular(5)),
        width: 10,
        height: 10,
      ));
    }

    return Row(
      children: _dots.toList(),
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.autoplay == true) {
      _controller = PageController(initialPage: _currentIndex);
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _timer =
            Timer.periodic(Duration(milliseconds: widget.interval), (value) {
          // print("定时器");
          _currentIndex = (_currentIndex + 1) % widget.children.length;
          _controller.animateToPage(_currentIndex,
              duration: Duration(milliseconds: widget.duration),
              curve: Curves.ease);
          setState(() {});
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.autoplay == true) {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    print("默认数据是不缓存的");
    return Stack(children: [
      SizedBox(
        width: widget.width,
        height: widget.height,
        child: widget.autoplay
            ? PageView(
                controller: _controller,
                scrollDirection: widget.scrollDirection,
                children: widget.children,
                onPageChanged: _onPageChanged)
            : PageView(
                scrollDirection: widget.scrollDirection,
                children: widget.children,
                onPageChanged: _onPageChanged),
      ),
      Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            width: widget.width,
            height: widget.indicator,
            child: Center(
              child: dots(),
            ),
          ))
    ]);
  }
  
  @override
  bool get wantKeepAlive => true;
}
