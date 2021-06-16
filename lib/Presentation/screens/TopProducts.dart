import 'package:flutter/material.dart';
import 'package:in_stealth/Data/providers/cartProvider.dart';
import 'package:in_stealth/Data/providers/productProvider.dart';
//import 'package:in_stealth/Presentation/widgets/vCardWidget.dart';
import 'package:provider/provider.dart';

class TopProducts extends StatelessWidget {
  const TopProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    productProvider.fetchTopProductsData();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: productProvider.getTopProductsList.map(
            (e) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 120,
                  height: 230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            e.productImageURL,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                e.productName,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Container(
                              child: Text(e.productSKU),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                e.productPrice.toString(),
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                              ),
                            ),
                            Container(
                              child: Text(
                                e.productStrikePrice.toString(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                          ],
                        ),
                      ),
                      e.productInStock == true
                          ? Text('In stock', style: TextStyle(color: Colors.green))
                          : Text('Out of stock', style: TextStyle(color: Colors.red)),
                      GestureDetector(
                        onTap: () {
                          cartProvider.addItemToCart(
                            e.productID,
                            e.productName,
                            e.productPrice,
                            e.productImageURL,
                            e.productSKU,
                            e.productQuantity,
                          );
                          print(e.productQuantity);
                          print(e.productID);
                        },
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: Colors.green),
                          child: Center(
                            child: Text('Add to card'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
