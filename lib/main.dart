import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import './pages/snowman.dart';
import './pages/ball.dart';
import './pages/hero动画/first.dart';
import './pages/MusicStore/index.dart';
import './pages/list_view.dart';
import './pages/dynamic_list_view.dart';
import './pages/builder_list_view.dart';
import './pages/grid_view.dart';
import './pages/builder_grid_view.dart';
import './pages/layout_box.dart';
import './pages/stack.dart';
import './pages/stack_position.dart';
import './pages/aspect_ratio.dart';
import './pages/card_page.dart';
import './pages/warp_page.dart';
import './pages/tabbar_page.dart';
import './pages/floating_tabbar_page.dart';
import './pages/drawer_page.dart';
import './pages/tabbar_view_page.dart';
import './pages/swiper_page.dart';
import './pages/animated_list_page.dart';
import './pages/animated_page.dart';
import './pages/z_paging_page.dart';
import './pages/getx_page.dart';
import 'pages/dialog_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //主题颜色
  static final List theme = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.grey,
    Colors.black,
    Colors.yellow,
    Colors.pink,
    Colors.purple
  ];
  //当前选中的主题下标
  static int currentThemeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        brightness:
            currentThemeIndex % 2 == 0 ? Brightness.dark : Brightness.light,
        primarySwatch: _MyAppState.theme[2],
      ),
      home: const MyHomePage(title: 'Flutter'),
      //初始路由
      initialRoute: "/home",
      //一般来说，main配置路由，使用initialRoute设定刚进来的主页，如登录页面
      routes: {
        "/home":(context)=>const TabbarPage(),
        "/snow": (context) => const SnowManPage(title: '命名路由-雪人'),
        "/ball": (context) => const BallPage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //菜单
  final List<Card> menus = [
    Card(
        "雪人",
        const SnowManPage(
          title: '雪人',
        )),
    Card("3d球球", const BallPage()),
    Card("Hero动画", const FirtsPage()),
    Card("B&O", const MusicStorePage()),
    Card("ListView列表", const ListViewPage()),
    Card("动态ListView", const DynamicListViewPage()),
    Card("动态BuilderListView", const BuilderListView()),
    Card("动态GridView", const GridViewPage()),
    Card("使用builder的GridView", const BuilderGridViewPage()),
    Card("各种布局实验", const LayoutBoxPage()),
    Card("Stack布局", const StackPage()),
    Card("Stack+Position实现绝对定位布局", const StackPositionPage()),
    Card("AspectRadio实现固定宽高比", const AspectRatioPage()),
    Card("卡片", const CardPage()),
    Card("Warp布局", const WarpPage()),
    Card("TabBar", const TabbarPage()),
    Card("中间凸起的tabbar", const FloatingTabbarPage()),
    Card("侧边栏drawer", const DrawerPage()),
    Card("顶部滑动导航", const TabbarViewPage()),
    Card("弹窗",const DialogPage()),
    Card("轮播图组件",const SwiperPage()),
    Card("带动画的列表",const AnimatedListPage()),
    Card("Flutter动画",const AnimatedPage()),
    Card("z-paging",const ZPagingPage()),
    Card("GetX示例",const GetxPage())
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      // android 平台
      SystemUiOverlayStyle _style =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(_style);
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: const Icon(Icons.route),
              onPressed: () {
                Navigator.pushNamed(context, '/snow');
              },
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                    //通过showDialog方法展示alert弹框
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Text('提示'), //弹框标题
                        content: const Text('是否想放弃学习Flutter'), //弹框内容
                        actions: <Widget>[
                          //操作控件
                          CupertinoDialogAction(
                            onPressed: () {
                              //控件点击监听
                              print("我不会放弃的");
                              Navigator.pop(context);
                            },
                            // ignore: prefer_const_constructors
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent), //按钮上的文本风格
                            child: const Text('取消'), //控件显示内容
                          ),
                          CupertinoDialogAction(
                            onPressed: () {
                              print("我投降");
                              Navigator.pop(context);
                            },
                            textStyle: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                            child: const Text('确定'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.window))
          ],
          leading: IconButton(
            icon: Icon(_MyAppState.currentThemeIndex % 2 == 0
                ? Icons.sunny
                : Icons.monochrome_photos),
            onPressed: () {
              print(_MyAppState.theme[_MyAppState.currentThemeIndex]);
              if (_MyAppState.currentThemeIndex >=
                  _MyAppState.theme.length - 1) {
                setState(() {
                  _MyAppState.currentThemeIndex = 0;
                });
              } else {
                setState(() {
                  _MyAppState.currentThemeIndex++;
                });
              }
            },
          ),
        ),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: menus.length,
            itemBuilder: (BuildContext context, int index) {
              return TextButton(
                  onPressed: () => {
                        //两种跳转方式

                        //1 Navigator.of(context).push(MaterialPageRoute) 普通路由，直接push一个dart页面
                        //2 Navigator.pushNamed(name) 命名路由--常用于统一管理

                        //替换路由
                        // Navigator.of(context).pushReplacementNamed();

                        //返回到指定根路由
                        // Navigator.of(context).pushAndRemoveUntil();

                        //返回上一页：Navigator.of(context).pop();
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (context) {
                          return menus[index].widget;
                        }))
                      },
                  child: Text(menus[index].cardName));
            }));
  }
}

//每个菜单
class Card {
  //名字
  late String cardName;
  //跳转的路由
  late String routeName;
  //跳转的页面组件
  late Widget widget;
  Card(this.cardName, this.widget);
}
