import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widget/my_dialog.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({Key? key}) : super(key: key);

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  void _alertDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text('您确定要删除吗'),
            actions: [
              TextButton(
                  onPressed: () {
                    print("ok");
                    Navigator.of(context).pop("确定");
                  },
                  child: const Text("确定")),
              TextButton(
                  onPressed: () {
                    print("cancel");
                    Navigator.of(context).pop("取消");
                  },
                  child: const Text("取消"))
            ],
          );
        });
    Fluttertoast.showToast(
        msg: result,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: result == '确定' ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _alertSelection() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(title: Text("请选择你的英雄"), children: [
            SimpleDialogOption(
              child: const Text("小美"),
              onPressed: () {
                Navigator.of(context).pop("小美");
              },
            ),
            SimpleDialogOption(
              child: const Text("雾子"),
              onPressed: () {
                Navigator.of(context).pop("雾子");
              },
            ),
            SimpleDialogOption(
              child: const Text("堡垒"),
              onPressed: () {
                Navigator.of(context).pop("堡垒");
              },
            ),
          ]);
        });
    Fluttertoast.showToast(
        msg: result,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _showActionSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            child: Column(
              children: [
                ListTile(title: const Text("分享")),
                ListTile(title: const Text("收藏")),
                ListTile(title: const Text("取消")),
              ],
            ),
          );
        });
    Fluttertoast.showToast(
        msg: result,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _showMyDialog() async {
    var result=await showDialog(
        context: context,
        builder: (context) {
          return MyDialog(
            title: "隐私协议",
            content: "清算时间到,清算时间到清算时间到清算时间到清算时间到清算时间到清算时间到清算时间到清算时间到",
            confirmText: "同意",
            cancelText: "不同意",
            confirm: (){
              print("同意");
            },
            cancel: (){
              print("不同意");
            }
          );
        });
        print("result"+result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹窗"),
      ),
      body: ListView(
        children: [
          TextButton(
              onPressed: () {
                _alertDialog();
              },
              child: const Text("alertDialog")),
          TextButton(
              onPressed: () {
                _alertSelection();
              },
              child: const Text("alertSelection")),
          TextButton(
              onPressed: () {
                _showActionSheet();
              },
              child: const Text("showActionSheet")),
          TextButton(
              onPressed: () {
                _showMyDialog();
              },
              child: const Text("自定义Dialog")),
        ],
      ),
    );
  }
}
