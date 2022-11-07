import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RenderObjectPage extends StatefulWidget {
  const RenderObjectPage({ Key? key }) : super(key: key);

  @override
  _RenderObjectPageState createState() => _RenderObjectPageState();
}

class _RenderObjectPageState extends State<RenderObjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RenderObject-底层布局原理"),
      ),
      body: Container(
        color: Colors.red,
        width: 200,
        height: 200,
        child: MyRenderBox(
          child: const FlutterLogo(),
        ),
      ),
    );
  }
}



class MyRenderBox extends SingleChildRenderObjectWidget{

  MyRenderBox({Key? key, required Widget child}) : super(key: key, child: child);
  
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
  
}


//相当于一个render底层实现，如何去绘制、渲染Widget
class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin{

  @override
  void performLayout() {
    child?.layout(constraints);
    size=const Size(200,200);
    super.performLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
    context.pushOpacity(offset, 127, (context, offset) { 
      context.paintChild(child!, offset+const Offset(20,20));
    });
    // context.canvas.drawRect(rect, paint);
    super.paint(context, offset);
  }
}