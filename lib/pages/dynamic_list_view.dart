import 'package:flutter/material.dart';
import '../res/listData.dart';

class DynamicListViewPage extends StatefulWidget {
  const DynamicListViewPage({Key? key}) : super(key: key);

  @override
  State<DynamicListViewPage> createState() => _DynamicListViewPage();
}

class _DynamicListViewPage extends State<DynamicListViewPage> {


  List<Widget> _initListData(){

    //第一种方法
    // List<Widget> list=[];
    // for(var i = 0;i<listData.length;i++){
    //   list.add(
    //     ListTile(
    //       leading: Image.network(listData[i]["imageUrl"]),
    //       title:Text(listData[i]["title"]),
    //       subtitle: Text(listData[i]["author"]),  
    //     )
    //   );
    // }
    // return list;

    //第二种方法
    //需要toList;
    return listData.map((item){
      return ListTile(
          leading: Image.network(item["imageUrl"]),
          title:Text(item["title"]),
          subtitle: Text(item["author"]),  
        );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("动态ListView"),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          children: _initListData()
        ));
  }
}
