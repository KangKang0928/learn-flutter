import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnowManPage extends StatefulWidget {
  const SnowManPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<SnowManPage> createState() => _SnowManPageState();
}

class _SnowManPageState extends State<SnowManPage>
    with SingleTickerProviderStateMixin {
  // 动画控制器
  late AnimationController _controller;
  final List<SnowFlake> _snowflakes =
      List.generate(10000, (index) => SnowFlake());
  @override
  void initState() {
    // 每秒执行
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this)
          ..repeat();
    super.initState();
    print("参数");
    print(Get.arguments);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
                //BoxConstraints的expand内部实现也是double.infinity
                // constraints: BoxConstraints.expand(),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.lightBlue, Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.8, 1.0])),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) {
                    return CustomPaint(
                      painter: MyPainter(_snowflakes),
                    );
                  },
                ))));
  }
}

// 面板
class MyPainter extends CustomPainter {
  //雪花
  late List<SnowFlake> _snowflakes;

  MyPainter(this._snowflakes);

  @override
  void paint(Canvas canvas, Size size) {
    final whitePaint = Paint()..color = Colors.white;
    canvas.drawCircle(size.center(const Offset(0, 80)), 60, whitePaint);
    canvas.drawOval(
        Rect.fromCenter(
            center: size.center(const Offset(0, 250)), width: 200, height: 250),
        whitePaint);
    _snowflakes.forEach((snowflake) {
      // 绘制雪花
      canvas.drawCircle(
          Offset(snowflake.x, snowflake.y), snowflake.radius, whitePaint);
      // 让雪花动起来
      snowflake.fall();
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// 雪花
class SnowFlake {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 800;
  double v = Random().nextDouble() * 5 + 2;
  double radius = Random().nextDouble() * 1 + 1;

  void fall() {
    y += v;
    if (y > 800) {
      x = Random().nextDouble() * 400;
      y = 0;
      v = Random().nextDouble() * 5 + 2;
      radius = Random().nextDouble() * 1 + 1;
    }
  }
}
