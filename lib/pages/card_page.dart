import 'package:flutter/material.dart';
import '../res/listData.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  int toggle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("卡片布局"),
        actions: [
          IconButton(
              icon: Icon(toggle == 0 ? Icons.toggle_on : Icons.toggle_off),
              onPressed: () {
                setState(() {
                  toggle = toggle == 0 ? 1 : 0;
                });
              }),
        ],
      ),
      body: BodyPart(toggle),
    );
  }
}

// ignore: must_be_immutable
class BodyPart extends StatelessWidget {
  int toggle;

  BodyPart(this.toggle, {Key? key}) : super(key: key);

  Widget _itemBuilder(context, index) {
    return toggle == 0 ? const CardItem1() : CardItem2(listData[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: _itemBuilder,
      itemCount: listData.length,
    );
  }
}

// 卡片项1
class CardItem1 extends StatelessWidget {
  const CardItem1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: const [
          ListTile(
            title: Text(
              "张三",
              style: TextStyle(fontSize: 28),
            ),
            subtitle: Text("高级软件工程师"),
          ),
          Divider(),
          ListTile(
            title: Text("电话:18392813823"),
          ),
          ListTile(
            title: Text("地址：北京市海淀区"),
          )
        ],
      ),
    );
  }
}

//卡片项2
// ignore: must_be_immutable
class CardItem2 extends StatelessWidget {
  Map<String, String> item = {};

  CardItem2(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 10,
      margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: Column(
        children: [
          //封面 固定16/9
          AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(item["imageUrl"]!, fit: BoxFit.cover)),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item["imageUrl"]!),
            ),
            title: Text(item["title"]!),
            subtitle: Text(item["author"]!),
          )
        ],
      ),
    );
  }
}
