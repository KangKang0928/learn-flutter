import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxPage extends StatefulWidget {
  const GetxPage({Key? key}) : super(key: key);

  @override
  _GetxPageState createState() => _GetxPageState();
}

class _GetxPageState extends State<GetxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX示例"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    _alertDialog(context);
                  },
                  child: const Text("Flutter默认的dialog")),
              ElevatedButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "提示信息",
                        middleText: "您确定要删除吗?",
                        confirm: ElevatedButton(
                            onPressed: () {
                              print("确定");
                              Get.back();
                            },
                            child: Text("确定")),
                        cancel: ElevatedButton(
                            onPressed: () {
                              print("取消");
                              Get.back();
                            },
                            child: Text("取消")));
                  },
                  child: const Text("GetX defaultDialog")),
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar("系统消息", "你快给我回来！村里做免费核酸了！");
                  },
                  child: const Text("GetX snackbar")),
              ElevatedButton(
                  onPressed: () {
                    Get.bottomSheet(Container(
                      color: Get.isDarkMode?Colors.black:Colors.white,
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.wb_sunny_outlined),
                            title: Text("白天模式",style: TextStyle(color:Colors.black87),),
                            onTap: (){
                              Get.changeTheme(ThemeData.dark());
                              Get.back();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.wb_sunny),
                            title: Text("夜间模式",style: TextStyle(color: Colors.black87),),
                            onTap: (){
                              Get.changeTheme(ThemeData.light());
                              Get.back();
                            },
                          )
                        ],
                      ),
                    ));
                  },
                  child: const Text("GetX bottomActionSheet切换主题"))
            ],
          ),
        ));
  }

  void _alertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: Text("提示信息"),
            content: Text("您确定要删除吗"),
            actions: [
              TextButton(onPressed: () {}, child: Text("确定")),
              TextButton(onPressed: () {}, child: Text("取消")),
            ],
          );
        });
  }
}
