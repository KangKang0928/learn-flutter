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
  _DetailsState(this.product) : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(product.name),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Center(
              child: Hero(
            tag: product.name,
            child: Image(
              image: AssetImage(product.image),
            ),
          )),
        ));
  }
}
