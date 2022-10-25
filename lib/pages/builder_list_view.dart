import 'package:flutter/material.dart';

class BuilderListView extends StatefulWidget {
  const BuilderListView({Key? key}) : super(key: key);

  @override
  State<BuilderListView> createState() => _BuilderListViewState();
}

class _BuilderListViewState extends State<BuilderListView> {

  List<String> list=[];
  _BuilderListViewState(){
    for(var i =0;i<20;i++){
      list.add("我是第$i条数据");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("使用ListViewBuilder来创建列表"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(list[index])
          );
        }
      ));
  }
}