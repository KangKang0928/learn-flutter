import 'package:flutter/material.dart';
import './second.dart';

class FirtsPage extends StatefulWidget {
  const FirtsPage({Key? key}) : super(key: key);

  @override
  State<FirtsPage> createState() => _FirtsPageState();
}

class _FirtsPageState extends State<FirtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hero动画"),
        ),
        body: Column(
          children: [
            Hero(
                tag: "heroImage",
                child: Container(
                  width: 300,
                  height: 300,
                  color: Colors.red[100],
                  child: Center(
                    child: Image.network(
                        "https://img95.699pic.com/photo/50072/1240.jpg_wh860.jpg"),
                  ),
                )),
            Center(
              child: TextButton(
                onPressed: () => {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SecondPage();
                  }))
                },
                child: const Text("跳转第二页"),
              ),
            )
          ],
        ));
  }
}
