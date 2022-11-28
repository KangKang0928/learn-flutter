import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RestaurantAppBar extends StatefulWidget {
  const RestaurantAppBar({Key? key}) : super(key: key);

  @override
  _RestaurantAppBarState createState() => _RestaurantAppBarState();
}

class _RestaurantAppBarState extends State<RestaurantAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.green[300],
      elevation: 0,
      expandedHeight: 200,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "assets/images/images/Header-image.png",
          fit: BoxFit.cover,
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset("assets/images/icons/back.svg"),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              "assets/images/icons/share.svg",
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              "assets/images/icons/search.svg",
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
