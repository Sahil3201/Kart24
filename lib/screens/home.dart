import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
// import 'package:getwidget/getwidget.dart';
import 'package:kart24/components/drawer.dart';
import 'package:kart24/components/productsList.dart';
import 'package:kart24/controllers/provider.dart';
import 'package:kart24/screens/cart.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userSignedIn;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: MyDrawer(),
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.red[700]!),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Kart24: Home",
                style: const TextStyle(
                  fontSize: 24,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w900,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Cart()));
                  },
                  icon: Icon(Icons.shopping_cart_rounded, size: 36))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [carousel(), CategoryList(), ProductList()],
          ),
        ));
  }

  GFCarousel carousel() {
    return GFCarousel(
      autoPlay: true, 
      items: [
        "assets/images/carousel_1.png",
        "assets/images/carousel_2.png",
        "assets/images/carousel_3.png",
        "assets/images/carousel_4.png",
      ].map(
        (imageItem) {
          return Container(
            margin: EdgeInsets.all(6.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Image(
                  image: new AssetImage(imageItem),
                  // color: null,
                  // height: 42,
                  width: 1000,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                )),
          );
        },
      ).toList(),
      onPageChanged: (index) {
        setState(() {
          // index;
        });
      },
    );
  }
}
