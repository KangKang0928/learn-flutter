import 'package:flutter/material.dart';

class TabbarViewPage extends StatefulWidget {
  const TabbarViewPage({Key? key}) : super(key: key);

  @override
  _TabbarViewPageState createState() => _TabbarViewPageState();
}

//为什么要引入SingleTickerProviderStateMixin呢？
class _TabbarViewPageState extends State<TabbarViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    //用于同步TabBar和TabBarView
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("顶部滑动导航"),
        bottom: TabBar(
            indicatorPadding: const EdgeInsets.all(5),
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(child: Text("推荐")),
              Tab(child: Text("热门")),
              Tab(child: Text("爱国爱党")),
              Tab(child: Text("地方特色")),
            ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: const [
              ListTile(
                title: Text("推荐"),
              )
            ],
          ),
          ListView(
            children: const [
              ListTile(
                title: Text("热门"),
              )
            ],
          ),
          SecondTabbarViewPage(),
          ListView(
            children: const [
              ListTile(
                title: Text("地方特色"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//二级滚动页
class SecondTabbarViewPage extends StatefulWidget {
  const SecondTabbarViewPage({Key? key}) : super(key: key);

  @override
  _SecondTabbarViewPage createState() => _SecondTabbarViewPage();
}

class _SecondTabbarViewPage extends State<SecondTabbarViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red),
          child: TabBar(
              indicatorPadding: const EdgeInsets.all(5),
              indicatorColor: Colors.white,
              controller: _tabController,
              isScrollable: true,
              tabs: const [
                Tab(child: Text("应知应会·少先队员")),
                Tab(child: Text("应知应会·共青团员")),
                Tab(child: Text("铭记初心")),
                Tab(child: Text("精彩回眸")),
                Tab(child: Text("经典著作"))
              ]),
        ),
        Expanded(
          flex: 1,
          child: TabBarView(controller: _tabController, children: [
            ListView(
              children: [ListTile(title: Text("应知应会·少先队员"))],
            ),
            ListView(
              children: [ListTile(title: Text("应知应会·共青团员"))],
            ),
            ListView(
              children: [ListTile(title: Text("铭记初心"))],
            ),
            ListView(
              children: [ListTile(title: Text("精彩回眸"))],
            ),
            ListView(
              children: [ListTile(title: Text("经典著作"))],
            )
          ]),
        )
      ],
    );
  }
}
