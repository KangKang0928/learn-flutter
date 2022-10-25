import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snowman/pages/layout_box.dart';

class StackPositionPage extends StatefulWidget {
  const StackPositionPage({Key? key}) : super(key: key);

  @override
  State<StackPositionPage> createState() => _StackPositionPageState();
}

class _StackPositionPageState extends State<StackPositionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack+Position实现绝对布局"),
      ),
      body: BodyPart(),
    );
  }
}

class BodyPart extends StatelessWidget {
  Widget _itemBuilder(context, index) {
    return ListTile(title: Text("item${index + 1}"));
  }

  @override
  Widget build(BuildContext context) {
    // return Stack(
    //   //相对于外部容器进行定位，如果没有外部容器，就是相对整个屏幕进行定位
    //   alignment: Alignment.center,
    //   children: [
    //     Container(
    //       height: 400,
    //       width: 300,
    //       color: Colors.red,
    //     ),
    //     Positioned(
    //         left: 0,
    //         child: Container(
    //           height: 200,
    //           width: 200,
    //           color: Colors.yellow,
    //         )),
    //     const Text("你好Flutter")
    //   ],
    return Stack(
      children: [
        ListView.builder(padding: const EdgeInsets.only(top:44),itemCount: 200, itemBuilder: _itemBuilder),
        Positioned(
            left: 0,
            top: 0,
            width: MediaQuery.of(context).size.width,
            height: 44,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    height: 44,
                    color: Colors.black87,
                    child: const Text(
                      "二级导航",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
