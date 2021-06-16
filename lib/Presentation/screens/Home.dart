import 'package:flutter/material.dart';
import 'package:in_stealth/Data/providers/cartProvider.dart';
import 'package:in_stealth/Presentation/screens/HomePage.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Icon(Icons.shopping_bag),
                  Text('(${cartProvider.cartItemCount})')
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('ShoppingCart');
            },
          )
        ],
      ),
      drawer: Drawer(),
      body: HomePage(),
    );
  }
}
