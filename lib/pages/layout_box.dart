import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LayoutBoxPage extends StatelessWidget {
  const LayoutBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("各种布局实验")
      ),
      body:BodyPart()
    );
  }
}

// body_part
class BodyPart extends StatelessWidget{
  const BodyPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(Icon(Icons.settings,color: Colors.white,), Colors.orange),
          IconContainer(Icon(Icons.search,color: Colors.white,), Colors.red),
          IconContainer(Icon(Icons.info_outline,color:Colors.white), Colors.black87)
        ],
      ),
    );
  }

}

//自定义组件
class IconContainer extends StatelessWidget{

  // icon图标
  Icon icon=const Icon(Icons.home);
  //背景颜色
  Color backgroundColor=Colors.red;
  //高
  double height=100.0;
  //宽
  double width=100.0;

  IconContainer(this.icon,this.backgroundColor,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:icon,
      color:backgroundColor,
      width: width,
      height: height,
    );
  }

}