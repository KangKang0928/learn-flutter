import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView"),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          children: <Widget>[
            const Divider(),
            ListTile(
              leading: Image.network(
                  "https://www.hswh.org.cn/d/file/wzzx/llyd/zz/2022-10-24/952567c8ef9e05b4452bb4da7dec10fc.jpg"),
              title: const Text("安远超：习近平总书记和工人阶级心连心"),
              subtitle:
                  const Text("2013年4月28日，中共中央总书记、国家主席、中央军委主席习近平来到全国总工会机关..."),
            ),
            const Divider(),
            ListTile(
              leading: Image.network(
                  "https://www.hswh.org.cn/d/file/wzzx/llyd/zz/2022-10-24/952567c8ef9e05b4452bb4da7dec10fc.jpg"),
              title: const Text("安远超：习近平总书记和工人阶级心连心"),
              subtitle:
                  const Text("2013年4月28日，中共中央总书记、国家主席、中央军委主席习近平来到全国总工会机关..."),
            ),
            const Divider(),
            ListTile(
              leading: Image.network(
                  "https://www.hswh.org.cn/d/file/wzzx/llyd/zz/2022-10-24/952567c8ef9e05b4452bb4da7dec10fc.jpg"),
              title: const Text("安远超：习近平总书记和工人阶级心连心"),
              subtitle:
                  const Text("2013年4月28日，中共中央总书记、国家主席、中央军委主席习近平来到全国总工会机关..."),
            ),
            const Divider(),
            ListTile(
              leading: Image.network(
                  "https://www.hswh.org.cn/d/file/wzzx/llyd/zz/2022-10-24/952567c8ef9e05b4452bb4da7dec10fc.jpg"),
              title: const Text("安远超：习近平总书记和工人阶级心连心"),
              subtitle:
                  const Text("2013年4月28日，中共中央总书记、国家主席、中央军委主席习近平来到全国总工会机关..."),
            ),
            const Divider(),
            Image.network(
                "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd21c0cc5.jpg"),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 44,
              child: const Text(
                "唯美伤感插画图片",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Image.network(
                "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd21115f4.jpg"),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 44,
              child: const Text(
                "唯美伤感插画图片",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Image.network(
                "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd205e070.jpg"),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 44,
              child: const Text(
                "唯美伤感插画图片",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            //
            const Divider(),
            Container(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Container(
                        height: 130,
                        child: Image.network(
                            "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd1f97c61.jpg"),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: const Text(
                          "唯美伤感插画图片",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Container(
                        height: 130,
                        child: Image.network(
                            "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd1eecb1a.jpg"),
                      ),
                      const Text(
                        "唯美伤感插画图片",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Container(
                        height: 130,
                        child: Image.network(
                            "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd1e42605.jpg"),
                      ),
                      const Text(
                        "唯美伤感插画图片",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Container(
                        height: 130,
                        child: Image.network(
                            "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd1d886de.jpg"),
                      ),
                      const Text(
                        "唯美伤感插画图片",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      )
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Container(
                        height: 130,
                        child: Image.network(
                            "http://pic1.win4000.com/wallpaper/2019-10-14/5da3dd1cde299.jpg"),
                      ),
                      const Text(
                        "唯美伤感插画图片",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            const Divider(),
            //
          ],
        ));
  }
}
