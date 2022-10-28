import 'dart:async';

import 'package:flutter/material.dart';
import '../res/listData.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({Key? key}) : super(key: key);

  @override
  _AnimatedListPageState createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final _globalkey = GlobalKey<AnimatedListState>();
  bool flag = true;

  Widget _buildItem(index) {
    return ListTile(
      title: Text(listData[index]["title"]),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          if (flag == true) {
            flag = false;
            _globalkey.currentState!.removeItem(index, (context, animation) {
              var removeItem = _buildItem(index);
              listData.removeAt(index); //删除元素
              return ScaleTransition(scale: animation, child: removeItem);
            });

            Timer.periodic(const Duration(milliseconds: 500),(timer){
              flag=true;
              timer.cancel();
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("带动画的列表")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            listData.add({"title": "我是新数据"});
            _globalkey.currentState!.insertItem(listData.length - 1);
          });
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedList(
        key: _globalkey,
        initialItemCount: listData.length,
        itemBuilder:
            (BuildContext context, int index, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: _buildItem(index),
          );
        },
      ),
    );
  }
}
