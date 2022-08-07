import 'dart:math';

import 'package:flutter/material.dart';

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  State<BallPage> createState() => _BallState();
}

class _BallState extends State<BallPage> {
  Offset _offset = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("3D小球"),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          //返回一个单位采样率的手势“向量”
          setState(() {
            _offset += details.delta;
          });
        },
        child: Center(
          child: CustomPaint(
              size: const Size(300, 300),
              painter: MyPainter(
                  rx: _offset.dy * 0.005, ry: _offset.dx * 0.005, rz: 0.0)),
        ),
      ),
    );
  }
}

// 创建我的面板
class MyPainter extends CustomPainter {
  late final double rx, ry, rz;

  MyPainter({required this.rx, required this.ry, required this.rz});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    //半径
    const double radius = 150;
    //分辨率
    const int resolution = 100;
    for (int i = 0; i < resolution; i++) {
      final theta = pi * i / resolution;
      for (int j = 0; j < resolution; j++) {
        final phi = 2 * pi * j / resolution;
        final x = radius * cos(phi) * sin(theta);
        final y = radius * sin(phi) * sin(theta);
        final z = radius * cos(theta);

        //变换矩阵 用于转换

        // x轴旋转
        double rxx = x;
        double rxy = cos(rx) * y + sin(rx) * z;
        double rxz = -sin(rx) * y + cos(rx) * z;
        //绕y周旋转
        double ryx = cos(ry) * rxx - sin(ry) * rxz;
        double ryy = rxy;
        double ryz = sin(ry) * rxx + cos(ry) * rxz;
        //绕z轴旋转
        double rzx = cos(rz) * ryx - sin(rz) * ryy;
        double rzy = sin(rz) * ryx + cos(rz) * ryy;
        double rzz = ryz;

        canvas.drawCircle(
            Offset(rzx, rzy),
            1,
            Paint()
              ..color = Color.fromARGB(
                  255, j * 255 ~/ resolution, i * 255 ~/ resolution, 255));
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
