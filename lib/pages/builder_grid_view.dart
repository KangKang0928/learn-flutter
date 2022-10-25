import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../res/listData.dart';

class BuilderGridViewPage extends StatefulWidget {
  const BuilderGridViewPage({Key? key}) : super(key: key);

  @override
  State<BuilderGridViewPage> createState() => _BuilderGridViewPageState();
}

class _BuilderGridViewPageState extends State<BuilderGridViewPage> {
  //动态生成gridview的函数
  Widget _initGridViewData(context, index) {
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
            child: Image.network(listData[index]["imageUrl"]),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10)),
            ),
          ),
          Column(
            children: [
              Text("${listData[index]["title"]}",
                  style: const TextStyle(fontSize: 20, color: Colors.black)),
              const SizedBox(height: 5),
              Text(
                "${listData[index]['author']}",
                style: const TextStyle(color: Colors.black38),
              )
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("使用builder的网格布局"),
        ),
        body: GridView.builder(
            itemCount: listData.length,
            padding: EdgeInsets.all(10),
            physics: const BouncingScrollPhysics(),
            //grid代理类型 横轴（辅轴）方向数量固定的网格布局
            gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                mainAxisExtent: 220,
                crossAxisSpacing: 10),
            itemBuilder: _initGridViewData));
  }
}

//注意！组件一定是个类哦
