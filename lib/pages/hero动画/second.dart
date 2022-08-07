import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero动画第二页"),
      ),
      body: Center(
          child: Hero(
              tag: "heroImage",
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.red[900],
                child: Center(
                  child: Image.network(
                      "https://img95.699pic.com/photo/50072/1240.jpg_wh860.jpg"),
                ),
              ))),
    );
  }
}
