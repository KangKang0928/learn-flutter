import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../widget/z_paging.dart';

class ZPagingPage extends StatefulWidget {
  const ZPagingPage({Key? key}) : super(key: key);

  @override
  _ZPagingPageState createState() => _ZPagingPageState();
}

class _ZPagingPageState extends State<ZPagingPage> {
  getDataList(_page, pageSize) async {
    var url =
        "http://www.phonegap100.com/appapi.php?a=getPortalList&catid=20&page=${_page}";
    Response result = await Dio().get(url);
    print("result---------");
    print(json.decode(result.data)["result"]);
    return json.decode(result.data)["result"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("z-paging flutter版本"),
        ),
        body: ZPaging(query: (pageNo, pageSize) async {
          var result = await getDataList(pageNo, pageSize);
          // print("result");
          // print(result.map((item){return item["title"];}).toList());
          return result.map((item) {
            return item["title"];
          }).toList();
        }, builder:
            (BuildContext buildContext, Object item, int index, List dataList) {
          return Card(
            child: ListTile(
              title: Text("$item"),
              subtitle: Text("$index"),
            ),
          );
        }));
  }
}
