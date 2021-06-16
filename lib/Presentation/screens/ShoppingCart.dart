import 'package:flutter/material.dart';
import 'package:in_stealth/Data/model/CartModel.dart';
import 'package:in_stealth/Data/providers/cartProvider.dart';
import 'package:in_stealth/Data/providers/orderProvider.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    double total = cartProvider.totalAmount;
    double tax = total * 0.05;
    double shipping = total == 0
        ? 0
        : (total + tax) < 200
            ? 20
            : 0;
    double grandTotal = total + tax + shipping;

    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Shopping cart',
          ),
        ),
        body: Column(
          children: cartProvider.cartItems.entries
              .map((e) => shoppingCartItem(e.key, e.value, context))
              .toList(),
        ),
        bottomNavigationBar: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16))),
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      height: 100,
                      // color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total:'),
                            Text('Tax:'),
                            Text('Shipping:'),
                            Text('Grand total:')
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 100,
                      // color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(total.toStringAsFixed(2)),
                            Text(tax.toStringAsFixed(2)),
                            Text(shipping.toStringAsFixed(2)),
                            Text(grandTotal.toStringAsFixed(2))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    Provider.of<OrderProvider>(context, listen: false).addOrder(
                        cartProvider.cartItems.values.toList(), grandTotal);
                    grandTotal > 0
                        ? Navigator.of(context).pushNamed('CheckOut')
                        : null;
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    color: Colors.blue,
                    child: Center(
                      child: Text('Checkout'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget shoppingCartItem(String key, CartModel value, BuildContext context) {
  CartProvider cartProvider = Provider.of<CartProvider>(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(value.productImageURL),
              backgroundColor: Colors.transparent,
              // child: Image.network(value.productImageURL, fit: BoxFit.cover,),
            ),
          ),
          Container(
            width: 250,
            // color: Colors.pink,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        value.productName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                            'Price: ${(value.productPrice * value.productQuantity).toString()}'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quantity:'),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              cartProvider.removeSingleItem(value.productID);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.remove),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(value.productQuantity.toString()),
                          ),
                          GestureDetector(
                            onTap: () {
                              cartProvider.addItemToCart(
                                  value.productID,
                                  value.productName,
                                  value.productPrice,
                                  value.productImageURL,
                                  value.productSKU,
                                  value.productQuantity);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                  onTap: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .removeItem(value.productID);
                  },
                  child: Icon(Icons.delete)),
            ),
          ),
        ],
      ),
    ),
  );
}
