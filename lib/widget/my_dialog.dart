import 'package:flutter/material.dart';

//参数
enum MyDialogButtonDirection { ROWREVERSE, ROW }

class MyDialog extends Dialog {
  ///属性
  ///标题
  String title;

  ///内容
  String content;

  ///函数
  ///确定函数
  void Function() confirm;

  ///确定的字
  String confirmText;

  ///取消的字
  String cancelText;

  ///取消函数
  void Function() cancel;

  ///按钮方向
  MyDialogButtonDirection myDialogButtonDirection;

  MyDialog(
      {Key? key,
      this.title = "标题",
      this.content = "内容",
      this.confirmText = "确定",
      this.cancelText = "取消",
      this.myDialogButtonDirection = MyDialogButtonDirection.ROW,
      required this.confirm,
      required this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 400,
          width: MediaQuery.of(context).size.width * 3 / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 顶部标题
              Container(
                  height: 60,
                  child: Center(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                  )),
              //中间文本
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      content,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )),
              //底部按钮
              Column(
                children: [
                  Divider(),
                  Container(
                    height: 60,
                    child: Flex(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      direction: Axis.horizontal,
                      children: myDialogButtonDirection ==
                              MyDialogButtonDirection.ROW
                          ? [
                              Expanded(
                                  child: Container(
                                child: Center(
                                    child: TextButton(
                                        onPressed: () {
                                          cancel();
                                          Navigator.of(context).pop(cancelText);
                                        },
                                        child: Text(cancelText))),
                              )),
                              Expanded(
                                  child: Container(
                                child: Center(
                                    child: TextButton(
                                  onPressed: () {
                                    confirm();
                                    Navigator.of(context).pop(confirmText);
                                  },
                                  child: Text(confirmText),
                                )),
                              ))
                            ]
                          : [
                              Expanded(
                                  child: Container(
                                child: Center(
                                    child: TextButton(
                                  onPressed: () {
                                    confirm();
                                    Navigator.of(context).pop(confirmText);
                                  },
                                  child: Text(confirmText),
                                )),
                              )),
                              Expanded(
                                  child: Container(
                                child: Center(
                                    child: TextButton(
                                        onPressed: () {
                                          cancel();
                                          Navigator.of(context).pop(cancelText);
                                        },
                                        child: Text(cancelText))),
                              ))
                            ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
