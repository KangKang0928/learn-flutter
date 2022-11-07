import 'package:flutter/material.dart';

class SliverPage extends StatefulWidget {
  const SliverPage({Key? key}) : super(key: key);

  @override
  _SliverPageState createState() => _SliverPageState();
}

class _SliverPageState extends State<SliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverPage"),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          //片段一
          SliverList(
              delegate: SliverChildBuilderDelegate(((context, index) {
            return Container(
              height: 200,
              color: Colors.primaries[index % Colors.primaries.length],
            );
          }), childCount: 20)),
          //片段二
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 200,
                  color: Colors.primaries[index % Colors.primaries.length],
                );
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2))
        ],
      ),
    );
  }
}
