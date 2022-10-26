import 'package:flutter/material.dart';

class WarpPage extends StatefulWidget {
  const WarpPage({Key? key}) : super(key: key);

  @override
  _WarpPageState createState() => _WarpPageState();
}

class _WarpPageState extends State<WarpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warp布局:相当于web的flex布局"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          alignment:WrapAlignment.spaceAround,
          spacing: 10,
          runSpacing: 10,
          children: [
            MyButton("第 1 集",onPressed: ()=>{}),
            MyButton("第 2 集",onPressed: ()=>{}),
            MyButton("第 3 集",onPressed: ()=>{}),
            MyButton("第 4 集",onPressed: ()=>{}),
            MyButton("第 5 集",onPressed: ()=>{}),
            MyButton("第 6 集",onPressed: ()=>{}),
            MyButton("第 7 集",onPressed: ()=>{}),
            MyButton("第 8 集",onPressed: ()=>{}),
            MyButton("第 9 集",onPressed: ()=>{}),
            MyButton("第 10 集",onPressed: ()=>{}),
            MyButton("第 11 集",onPressed: ()=>{}),
            MyButton("第 12 集",onPressed: ()=>{}),
            MyButton("第 13 集",onPressed: ()=>{}),
            MyButton("第 14 集",onPressed: ()=>{}),
            MyButton("第 15 集",onPressed: ()=>{}),
            MyButton("第 16 集",onPressed: ()=>{}),
          ],
        ),
      ),
    );
  }
}

//自定义按钮组件
class MyButton extends StatelessWidget {
  //按钮文字
  String text;
  //点击方法
  void Function()? onPressed;

  MyButton(this.text, {Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(241, 255, 255, 255)),
          foregroundColor: MaterialStateProperty.all(Colors.black45)),
    );
  }
}
