import 'package:flutter/material.dart';

class CustomMultiChildLayoutPage extends StatefulWidget {
  const CustomMultiChildLayoutPage({Key? key}) : super(key: key);

  @override
  _CustomMultiChildLayoutPageState createState() =>
      _CustomMultiChildLayoutPageState();
}

class _CustomMultiChildLayoutPageState
    extends State<CustomMultiChildLayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CustomMultiChildLayout"),
        ),
        body: CustomMultiChildLayout(
          delegate: MyDelegate(),
          children: [
            LayoutId(id: "flutter_logo_1", child: FlutterLogo()),
            LayoutId(id: "flutter_logo_2", child: FlutterLogo()),
          ],
        ));
  }
}

///MultiChildLayout的局限性：
///1、不能无中生有，要渲染什么必须要传入children
///2、不能灵活地向上传递自身的布局，getSize函数
///
///renderObject可以解决这个问题
class MyDelegate extends MultiChildLayoutDelegate {

  @override
  Size getSize(BoxConstraints constraints) {

    //默认使用的上级的约束（constrains）
    return super.getSize(constraints);
  }

  @override
  void performLayout(Size size) {
    var size1, size2;
    if (hasChild("flutter_logo_1")) {
      size1 = layoutChild(
          "flutter_logo_1",
          //向下传递约束
          const BoxConstraints(
              minWidth: 100, minHeight: 100, maxWidth: 100, maxHeight: 100));
      //向上传递布局
      positionChild("flutter_logo_1", const Offset(0, 0));
    }
    if (hasChild("flutter_logo_2")) {
      size2 = layoutChild(
          "flutter_logo_2",
          //向下传递约束
          const BoxConstraints(
              minWidth: 200, minHeight: 200, maxWidth: 200, maxHeight: 200));
      //向上传递布局
      positionChild("flutter_logo_2", Offset(size1.width, size1.height));
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
