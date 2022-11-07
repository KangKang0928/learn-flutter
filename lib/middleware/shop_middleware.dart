import 'package:flutter/material.dart';
import 'package:get/get.dart';

///使用路由中间件实现路由拦截

class ShopMiddleWare extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route){
    print("---------");
    print(route);
    // return null;
    return const RouteSettings(name:"/home");
  }
}