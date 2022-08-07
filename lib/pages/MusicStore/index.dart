import 'package:flutter/material.dart';
import 'package:snowman/pages/MusicStore/details.dart';
import 'package:snowman/pages/MusicStore/extensions/color_hex.dart';
import 'package:snowman/pages/MusicStore/models/category.dart';
import 'package:snowman/pages/MusicStore/models/product.dart';
import './details.dart';

import 'extensions/color_random.dart';

class MusicStorePage extends StatefulWidget {
  const MusicStorePage({Key? key}) : super(key: key);

  @override
  State<MusicStorePage> createState() => _MusicStorePageState();
}

class _MusicStorePageState extends State<MusicStorePage> {
  //分类
  final List<Category> _categoryList = [Category.speak(), Category.headphone()];
  //当前选中的分类
  int _selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "商店",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // 分类
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                '按分类浏览',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87),
              ),
            )),
            // 分类列表
            SliverToBoxAdapter(
                child: Container(
              height: 248,
              child: ListView.builder(
                  itemCount: _categoryList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (builder, index) {
                    //分类列表
                    return categoryCard(_categoryList[index], index);
                  }),
            )),
            // 空
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            // 对应分类的商品列表
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "猜你喜欢",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                  15, 15, 15, MediaQuery.of(context).padding.bottom + 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 145 / 209,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                delegate: SliverChildBuilderDelegate((ctx, index) {
                  return productCard(
                      _categoryList[_selectIndex].products[index]);
                }, childCount: _categoryList[_selectIndex].products.length),
              ),
            )
          ],
        ),
      ),
    );
  }

  //分类卡片
  Widget categoryCard(Category category, int index) {
    double width = 235;
    double height = 248;
    double imageWidth = 205;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width,
          height: height,
          // color: RandomColor.next(),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Image(
                    image: const AssetImage('assets/images/bg_card.png'),
                    width: imageWidth,
                    height: 200,
                  )),
              Positioned(
                  child: Image(
                image: AssetImage(category.image),
                width: imageWidth,
                height: 160,
              )),
              Positioned(
                  bottom: 24,
                  child: Container(
                    width: imageWidth,
                    child: Column(
                      children: [
                        Text(
                          category.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: HexColor.fromHex('171717')),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          category.intro,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.blueGrey),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  //商品卡片
  Widget productCard(Product product) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: HexColor.fromHex('f9f9f9')),
        width: 200,
        height: 200,
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                  opacity: animation as Animation<double>,
                  child: Details(product: product));
            }));
          },
          child: Column(
            children: [
              Hero(
                tag: product.name,
                child: Image(image: AssetImage(product.image)),
              ),
              Text(
                product.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18),
              Text(
                '\$${product.formatPrice()}',
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ));
  }
}
