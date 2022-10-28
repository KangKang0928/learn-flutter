import 'package:flutter/material.dart';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({Key? key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter动画"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              flag = !flag;
              print(flag);
            });
          },
          child: const Icon(Icons.change_circle),
        ),
        body: Container(
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 1, milliseconds: 100),
              width: flag ? 300 : 0,
              height: flag ? 300 : 0,
              color: Colors.red,
            ),
          ),
        ));
  }
}
