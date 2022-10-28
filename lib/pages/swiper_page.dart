import 'package:flutter/material.dart';
import '../widget/my_swiper.dart';

class SwiperPage extends StatefulWidget {
  const SwiperPage({Key? key}) : super(key: key);

  @override
  _SwiperPageState createState() => _SwiperPageState();
}

class _SwiperPageState extends State<SwiperPage> {
  @override
  Widget build(BuildContext context) {

    //监听状态
    print(MediaQuery.of(context).orientation);


    return Scaffold(
        appBar: AppBar(
          title: const Text("轮播图组件"),
        ),
        body: ListView(
          children: [
            MySwiper(
              autoplay: false,
              activedIndicatorColor: Colors.black,
              children: [
                Image.network(
                    "https://cdn.cnbj1.fds.api.mi-img.com/product-images/xiaomimaxfold27xrd4s/3816.png?x-fds-process=image/resize,q_100,f_webp",
                    fit: BoxFit.cover),
                Image.network(
                    "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/a7f4917c0a8eb1dc952baa2f0a75e509.jpg?w=2452&h=920",
                    fit: BoxFit.cover),
                Image.network(
                    "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cc04061612b77ff4112c399ce461dc58.jpg?thumb=1&w=2452&h=920&f=webp&q=90",
                    fit: BoxFit.cover),
                Image.network(
                    "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/cc7066c191db41583516f8b49c78c503.jpg?thumb=1&w=2452&h=920&f=webp&q=90",
                    fit: BoxFit.cover),
                Image.network(
                    "https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/bc0410f7954a5aec9c15e41c2cfe6a0f.jpg?thumb=1&w=2452&h=920&f=webp&q=90",
                    fit: BoxFit.cover),
              ],
            ),
          ],
        ));
  }
}
