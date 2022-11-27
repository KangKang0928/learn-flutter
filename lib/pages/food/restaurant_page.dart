import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snowman/pages/food/components/restaruant_categories.dart';
import 'package:snowman/pages/food/components/restaurant_app_bar.dart';
import 'package:snowman/pages/food/components/restaurant_info.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const RestaurantAppBar(),
          const SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverToBoxAdapter(
            child: Categories(
                onChanged: (index) {
                  setState(() {
                    _selectIndex = index;
                  });
                },
                selectedIndex: _selectIndex),
          )
        ],
      ),
    );
  }
}
