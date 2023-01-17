import 'package:flutter/material.dart';
import 'package:kart24/components/drawer.dart';
import 'package:kart24/controllers/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<dynamic> cartJson = [];

  @override
  void initState() {
    cartJson = Kart.getInstance.getCartJson;
    print(cartJson);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: MyDrawer(),
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.red[700]!),
          title: const Text(
            "Kart24: Cart",
            style: const TextStyle(
              fontSize: 24,
              color: const Color(0xff000000),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () => openDialog(context),
            child: Text("Place order", style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
                primary: Colors.red[700],
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(12.0),
                ))),
        body: ListView.builder(
            physics: ScrollPhysics(
                parent: const BouncingScrollPhysics(
                    parent: const AlwaysScrollableScrollPhysics())),
            itemCount: cartJson.length,
            itemBuilder: (BuildContext ctxt, int index) {
              if (cartJson[index].containsKey('p_quantity') &&
                  cartJson[index]['p_quantity'] != 0)
                return Card(
                  child: ListTile(
                    leading: Center(
                        widthFactor: 1,
                        child: Image.asset(cartJson[index]['p_image'])),
                    title: Text(cartJson[index]["p_name"]),
                    subtitle: Text(cartJson[index]['p_cost'].toString() +
                        ' * ' +
                        cartJson[index]['p_quantity'].toString()),
                    trailing: Text(
                        '\u{20B9} ' +
                            (cartJson[index]['p_cost'] *
                                    cartJson[index]['p_quantity'])
                                .toString(),
                        style: TextStyle(fontSize: 26)),
                  ),
                );
              else
                return Container();
            }));
  }

  void openDialog(BuildContext context) => showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                Kart.getInstance.getProdList.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 15,
              ),
            ),
          );
        },
      );
}
