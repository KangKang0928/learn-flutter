import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snowman/pages/food/components/menu_card.dart';
import 'package:snowman/pages/food/components/restaruant_categories.dart';
import 'package:snowman/pages/food/components/restaurant_app_bar.dart';
import 'package:snowman/pages/food/components/restaurant_info.dart';
import 'package:snowman/pages/food/models/menu.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  int _selectIndex = 0;
  final _scrollController = ScrollController();
  double restaurantInfoHeight = 200 + 170 - kToolbarHeight;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      print(_scrollController.offset);
    });
  }

  void scrollToCategory(int index) {
    if(_selectIndex!=index){
      
    }
    int totalItems = 0;
    for (var i = 0; i < index; i++) {
      totalItems += demoCategoryMenus[i].items.length;
    }
    _scrollController.animateTo(restaurantInfoHeight + (116 * totalItems)+50*index,
        curve: Curves.ease, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const RestaurantAppBar(),
          const SliverToBoxAdapter(
            child: RestaurantInfo(),
          ),
          SliverPersistentHeader(
            delegate: RestaurantCategories(
                onChanged: scrollToCategory, selectedIndex: 0),
            pinned: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(delegate: SliverChildBuilderDelegate(
              (context, categoryIndex) {
                List<Menu> items = demoCategoryMenus[categoryIndex].items;
                return MenuCategoryItem(
                    title: demoCategoryMenus[categoryIndex].category,
                    items: List.generate(
                        items.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Container(
                                decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                          blurStyle: BlurStyle.outer)
                                    ],
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MenuCard(
                                    title: items[index].title,
                                    image: items[index].image,
                                    price: items[index].price,
                                  ),
                                ),
                              ),
                            )));
              },
            )),
          )
        ],
      ),
    );
  }
}
