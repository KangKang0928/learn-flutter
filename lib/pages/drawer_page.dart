import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HomeBody(), CategoryBody(), SettingsBody()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tabbar示例"),
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      drawer: Drawer(
        elevation: 0.0,
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(
                  flex: 1,
                  child: DrawerHeader(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "http://pic1.win4000.com/wallpaper/2019-05-06/5ccfc4b1d4627.jpg"))),
                      child: Text("头部")),
                )
              ],
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.my_library_add),
              ),
              title: Text("个人中心"),
            )
          ],
        ),
      ),
      endDrawer: Drawer(
        elevation: 0.0,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  //自带模板的DrawerHeader
                  child: UserAccountsDrawerHeader(
                    onDetailsPressed: () {
                      // ignore: avoid_print
                      print("1222");
                    },
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://c-ssl.dtstatic.com/uploads/blog/202105/04/20210504062111_d8dc3.thumb.1000_0.jpg"),
                    ),
                    otherAccountsPictures: const [],
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "http://pic1.win4000.com/wallpaper/2019-05-06/5ccfc4b1d4627.jpg"))),
                    accountEmail: const Text("wanwan@123.com"),
                    accountName: const Text("wanwan"),
                  ),
                )
              ],
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.my_library_add),
              ),
              title: Text("个人中心"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设置")
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}

// 首页
class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("首页"),
    );
  }
}

//分类
class CategoryBody extends StatelessWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("分类"),
    );
  }
}

//设置
class SettingsBody extends StatelessWidget {
  const SettingsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("设置"));
  }
}
