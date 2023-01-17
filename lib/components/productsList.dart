import 'package:flutter/material.dart';
import 'package:kart24/screens/productView.dart';
import 'package:provider/provider.dart';
import 'package:kart24/controllers/provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    var kart = context.watch<Kart>();
    Set<String> categories = kart.categoryList;
    String currentCategory = kart.currentCategory;

    return DropdownButton<String>(
      value: currentCategory,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.black,
      ),
      iconSize: 34,
      underline: Container(),
      elevation: 16,
      onChanged: (String? newValue) {
        setState(() {
          kart.setCurrentCategory(newValue!);
        });
      },
      selectedItemBuilder: (context) {
        return categories.toList().map<Widget>((String item) {
          return Center(
              child: Text(
            "Select Category: " + item,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ));
        }).toList();
      },
      items: categories.toList().map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    var kart = context.watch<Kart>();
    String currentCategory = kart.currentCategory;
    List<dynamic> prodList = kart.getProdList;
    return ListView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 1,
        //   mainAxisSpacing: 0,
        //   // crossAxisSpacing: 20,
        //   childAspectRatio: 3,
        // ),
        itemCount: prodList.length,
        itemBuilder: (context, index) {
          // if (!(currentCategory == 'All' || currentCategory != prodList[index]['p_category']))
          if (!(currentCategory == 'All' ||
              currentCategory == prodList[index]['p_category']))
            return Container(); //SizedBox(height: 10, child: Text("data"));
          else
            return Card(
                clipBehavior: Clip.antiAlias,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2.0),
                          child: Image.asset(
                            prodList[index]["p_image"]!,
                            color: prodList[index]["p_availability"] < 1
                                ? Colors.white.withOpacity(0.5)
                                : null,
                            colorBlendMode: BlendMode.modulate,
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height / 5,
                            // width: MediaQuery.of(context).size.width / 2.5,
                            // alignment: Alignment.centerLeft,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                prodList[index]["p_name"],
                                style: TextStyle(fontSize: 23),
                              ),
                              Text(
                                  "\u{20B9} " +
                                      prodList[index]["p_cost"].toString() +
                                      " per Kg.",
                                  style: TextStyle(
                                      color: Colors.red[700],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              prodList[index]["p_details"] != null
                                  ? Text(prodList[index]["p_details"] ?? "")
                                  : Container(),
                              prodList[index]["p_availability"] < 1
                                  ? Text(
                                      "Product unavailable",
                                      style: TextStyle(color: Colors.red[700]),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      ],
                    ),
                    prodList[index]["p_availability"] > 0
                        ? IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Product(index: index)));
                              // openDialog(context, index);
                            },
                            icon: Icon(
                              Icons.add_shopping_cart_outlined,
                              // color: Colors.red[700],
                              size: 30,
                            ))
                        : Container()
                  ],
                ));
        });
  }
}
