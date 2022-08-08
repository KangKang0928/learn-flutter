import 'package:flutter/material.dart';

import 'models/product.dart';

class Details extends StatefulWidget {
  late Product product;

  Details({Key? key, required this.product}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState(product);
}

class _DetailsState extends State<Details> {
  late Product product;
  int _selectIndex = 0;

  _DetailsState(this.product) : super();
  @override
  Widget build(BuildContext context) {
    //去除顶部状态栏的高度+导航栏高度
    double navigationBarBottom = MediaQuery.of(context).padding.top + 64;
    double bodyHeight =
        MediaQuery.of(context).size.height - navigationBarBottom;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Stack(children: [
          // 产品介绍
          Positioned.fill(
            left: 0,
            right: 0,
            top: bodyHeight * 0.5,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                width: screenWidth,
                height: MediaQuery.of(context).size.height * 0.55,
                color: Colors.white,
                child: Column(
                  children: [
                    //flex:1
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(88),
                          Text(
                            product.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          Gap(24),
                          Flexible(
                              child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              product.description,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.blueGrey),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Gap(22),
                          // 加入购物车按钮
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: product.styles[_selectIndex].color),
                              onPressed: () {},
                              child: Container(
                                height: 44,
                                child: Center(
                                  child: Text(
                                    "加入购物车",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                        color: product
                                                    .styles[_selectIndex].color
                                                    .computeLuminance() >
                                                0.5
                                            ? Colors.black87
                                            : Colors.white),
                                  ),
                                ),
                              )),
                          Gap(MediaQuery.of(context).padding.bottom + 24)
                        ],
                      ),
                    )
                  ],
                )),
          ),
          //产品图
          Positioned(
              top: 120,
              left: 100,
              width: 360,
              height: 360,
              child: Hero(
                tag: product.name,
                child: Image(
                  image: AssetImage(product.styles[_selectIndex].image),
                ),
              )),
          //产品售价
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 35, top: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.category,
                      style: const TextStyle(color: Colors.blueGrey),
                    ),
                    Gap(14),
                    Text(
                      product.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Gap(32),
                    const Text(
                      '售价',
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    Gap(6),
                    Text('\$${product.formatPrice()}起',
                        style: const TextStyle(fontSize: 16)),
                    Gap(12),
                    const Text(
                      "可选颜色",
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                    ),
                    Row(
                        children: List.generate(
                            product.styles.length,
                            (index) =>
                                productStyleItem(product.styles[index], index)))
                  ],
                ),
              ))
        ]));
  }

  //间隔
  Widget Gap(double gapHeight) {
    return SizedBox(height: gapHeight);
  }

  //颜色区块
  Widget productStyleItem(ProductStyle style, int index) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 14),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: style.color),
            width: 24,
            height: 24,
            child: Center(
              child: Opacity(
                opacity: _selectIndex == index ? 1 : 0,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: () {
                    setState(() {
                      _selectIndex = index;
                    });
                  },
                  icon: const Icon(Icons.check, color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
