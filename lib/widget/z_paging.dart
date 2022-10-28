/// flutter版本的z-paging 封装了基本的上拉加载、下拉刷新功能；
import 'package:flutter/material.dart';

class ZPaging extends StatefulWidget {
  ///query函数 返回每次分页的数据
  Future<List> Function(int pageNo, int pageSize) query;

  ///内部循环的列表 Widget Function(BuildContext, int)
  Widget Function(BuildContext, Object, int, List) builder;

  ///属性
  ///1、defaultPageSize
  int defaultPageSize;

  ZPaging(
      {Key? key,
      required this.query,
      required this.builder,
      this.defaultPageSize = 15})
      : super(key: key);

  @override
  _ZPagingState createState() => _ZPagingState();
}

class _ZPagingState extends State<ZPaging> {
  int _pageNo = 1;
  late int _pageSize;

  ///是否正在加载中
  bool _isLoading = false;
  bool _hasMore = true;

  List _dataList = [];

  ScrollController _scrollController = new ScrollController();

  ///刷新，重置_dataList与pageNo
  Future _onRefresh() async {
    setState(() {
      _pageNo = 1;
      _hasMore = true;
      _isLoading = false;
      // _dataList = [];
    });
    await _getDataList();
  }

  Future _getDataList() async {
    setState(() {
      _isLoading = true;
    });
    var _tempDataList = await widget.query(_pageNo, _pageSize);
    if (_tempDataList.isEmpty ||
        _pageNo == 1 && _tempDataList.length <= _pageSize) {
      _hasMore = false;
    }
    if(_pageNo==1){
      _dataList=[];
    }
    _dataList.addAll(_tempDataList);
    // print("_dataList");
    // print(_dataList.length);
    setState(() {
      _pageNo++;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _pageSize = widget.defaultPageSize;
    super.initState();
    _getDataList();
    // 监听滚动事件
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
              _scrollController.position.maxScrollExtent - 10 &&
          _isLoading == false) {
        _getDataList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        itemCount: _dataList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index != _dataList.length) {
            return widget.builder(context, _dataList[index], index, _dataList);
          } else {
            return Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: ZPagingLoadingMore(
                    text: _hasMore
                        ? _isLoading
                            ? "—— 正在加载中 ——"
                            : "—— 上拉加载更多 ——"
                        : "—— 没有更多数据了 ——"));
          }
        },
      ),
    );
  }
}

//===============空数据图、底部提示组件 start=================//

class ZEmptyView extends StatefulWidget {
  const ZEmptyView({Key? key}) : super(key: key);

  @override
  _ZEmptyViewState createState() => _ZEmptyViewState();
}

class _ZEmptyViewState extends State<ZEmptyView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

///默认的loadingmore组件
class ZPagingLoadingMore extends StatelessWidget {
  String text;

  ZPagingLoadingMore({Key? key, this.text = "上拉加载更多"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}


//===============空数据图、底部提示组件 end===================//