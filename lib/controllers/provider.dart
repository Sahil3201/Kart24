import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// final KartProvider =
//     ChangeNotifierProvider<Kart>((ref) => Kart());

class Kart extends ChangeNotifier {
  // static Kart? _instance;
  bool isInitialized = false;
  String currentCategory = "All";
  Set<String> categoryList = new Set.from(['All']);
  List<dynamic> prodJson = [];
  List<dynamic> cartJson = [];

  String prodStr = """
[
 {
 "p_name":"Apple",
 "p_id":1,
 "p_cost":30,
 "p_availability":1,
 "p_details":"Imported from Swiss",
 "p_category":"Premium",
 "p_image" : "assets/images/products/apple.jpg"
 },
 {
 "p_name":"Mango",
 "p_id":2,
 "p_cost":50,
 "p_availability":1,
 "p_details":"Farmed at Selam",
 "p_category":"Tamilnadu",
 "p_image" : "assets/images/products/mango.jpg"
 },
 {
 "p_name":"Banana",
 "p_id":3,
 "p_cost":5,
 "p_availability":0,
 "p_image" : "assets/images/products/banana.jpg"
 },
 {
 "p_name":"Orange",
 "p_id":4,
 "p_cost":25,
 "p_availability":1,
 "p_details":"from Nagpur",
 "p_category":"Premium",
 "p_image" : "assets/images/products/orange.jpg"
 }
]
""";

  factory Kart() => _instance;
  static Kart get getInstance => _instance;
  static final Kart _instance = Kart._();
  Kart._() {
    init();
  }

  init() async {
    prodJson = jsonDecode(prodStr);
    prodJson.forEach((element) {
      if (element.containsKey("p_category"))
        categoryList.add(element["p_category"]);
    });
    cartJson = List.filled(prodJson.length, {});
    // Map<String, String> temp=  {};
    // temp.containsKey(key)
    print("categoryList:");
    print(categoryList);
    print("Init complete");
  }

  List<dynamic> get getProdList => prodJson;
  List<dynamic> get getCartJson => cartJson;

  void setCurrentCategory(category) {
    currentCategory = category;
    notifyListeners();
    print("currentCategory changed to: " + currentCategory);
  }

  void setQuantity(int p_id, int quantity) {
    prodJson[p_id]["p_quantity"] = quantity;
    cartJson[p_id] = prodJson[p_id];
    print(cartJson);
  }

  void setprodJson(String newprodStr) {
    prodStr = newprodStr;
    init();
    notifyListeners();
  }
}
