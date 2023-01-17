import 'package:flutter/material.dart';
import 'package:kart24/components/drawer.dart';
import 'package:kart24/controllers/provider.dart';

class Product extends StatefulWidget {
  final int index;
  Product({
    Key? key,
    required this.index,
  });

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int _quantity = 0;
  int p_id = 0;

  @override
  void initState() {
    p_id = widget.index;
    _quantity = Kart.getInstance.getCartJson[p_id]['p_quantity']??0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dynamic prodList = Kart.getInstance.getProdList;

    prodList[p_id]["p_category"] != null
        ? Text(prodList[p_id]["p_category"],
            style:
                TextStyle(height: 2, fontWeight: FontWeight.bold, fontSize: 20))
        : null;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      drawer: MyDrawer(),
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.red[700]!),
        title: Row(
          children: [
            Icon(Icons.shopping_bag, size: 48),
            SizedBox(width: 10),
            const Text(
              "Add to basket",
              style: const TextStyle(
                fontSize: 24,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Text(
              (prodList[p_id]["p_category"] != null
                      ? prodList[p_id]["p_category"] + " / "
                      : "") +
                  prodList[p_id]["p_name"],
              style: TextStyle(
                  height: 2, fontWeight: FontWeight.bold, fontSize: 16)),
          Padding(
            padding: const EdgeInsets.fromLTRB(35, 12, 35, 6),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: Image.asset(
                prodList[p_id]["p_image"]!,
                fit: BoxFit.contain,
                // height: MediaQuery.of(context).size.height/3,
                // width: MediaQuery.of(context).size.width / 2.5,
                // alignment: Alignment.centerLeft,
              ),
            ),
          ),
          Text("\u{20B9}" + prodList[p_id]["p_cost"].toString(),
              style: TextStyle(
                  height: 2,
                  color: Colors.red[700],
                  fontSize: 28,
                  fontWeight: FontWeight.bold)),
          // SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: _quantity == 0
                      ? null
                      : () {
                          setState(() {
                            _quantity -= 1;
                            if (_quantity < 0) _quantity = 0;
                          });
                          Kart.getInstance.setQuantity(p_id, _quantity);
                        },
                  icon: Icon(Icons.remove_circle,
                      size: 36, color: Colors.blue[700])),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 3.0))),
                    child: Text(
                      _quantity.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25),
                    )),
              ),
              IconButton(
                  onPressed: _quantity == prodList[p_id]["p_availability"]
                      ? null
                      : () {
                          setState(() {
                            if (_quantity != prodList[p_id]["p_availability"]) {
                              _quantity += 1;
                            }
                          });
                          Kart.getInstance.setQuantity(p_id, _quantity);
                        },
                  icon: Icon(
                    Icons.add_circle,
                    size: 36,
                    color: Colors.blue[700],
                  )),
            ],
          ),
          Divider(),
          prodList[p_id]["p_details"] != null
              ? Text("More Info:",
                  style: const TextStyle(fontSize: 22, height: 2))
              : Container(),
          prodList[p_id]["p_details"] != null
              ? Text(prodList[p_id]["p_details"],
                  style: const TextStyle(height: 2))
              : Container(),
        ],
      ),
    );
  }
}
