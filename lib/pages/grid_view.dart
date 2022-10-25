import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../res/listData.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  //动态生成gridview
  List<Widget> _initGridView() {
    // List<Widget> tempList = [];
    // for (var i = 0; i < 30; i++) {
    //   tempList.add(Container(
    //     alignment: Alignment.center,
    //     decoration: const BoxDecoration(
    //         color: Color.fromARGB(255, 254, 254, 254),
    //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //         boxShadow: [
    //           BoxShadow(
    //               color: Color.fromARGB(10, 0, 0, 0),
    //               offset: Offset(0, 0),
    //               blurRadius: 20.0,
    //               spreadRadius:-5.0,
    //               blurStyle:BlurStyle.normal
    //               )
    //         ]),
    //     child: Text("我是第${i + 1}项",
    //         style: const TextStyle(fontSize: 20, color: Colors.black)),
    //   ));
    // }
    return listData.map((item) {
      return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 254, 254, 254),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(10, 0, 0, 0),
                  offset: Offset(0, 0),
                  blurRadius: 20.0,
                  spreadRadius: -5.0,
                  blurStyle: BlurStyle.normal)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Image.network(item["imageUrl"]),
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0),topRight:Radius.circular(10)),
              ),
            ),
            Column(
              children: [
                Text("${item["title"]}",
                    style: const TextStyle(fontSize: 20, color: Colors.black)),
                const SizedBox(height: 5),
                Text(
                  "${item['author']}",
                  style: const TextStyle(color: Colors.black38),
                )
              ],
            ),
            const SizedBox(height: 10)
          ],
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("网格布局"),
        ),
        body: GridView.count(
            padding: EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
            children: _initGridView()));

    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text("网格布局"),
    //     ),
    //     body: GridView.extent(
    //       //横轴子元素最大长度
    //       maxCrossAxisExtent:180,
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(color: Colors.red),
    //           child: Column(
    //             crossAxisAlignment:CrossAxisAlignment.center,
    //             children: [
    //               const Icon(Icons.ac_unit),
    //               const Text("雪花")
    //             ],
    //           ),
    //         )
    //       ],
    //     ));
  }
}
