import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:in_stealth/Data/providers/cartProvider.dart';
import 'package:in_stealth/Data/providers/orderProvider.dart';
import 'package:in_stealth/Data/providers/productProvider.dart';
import 'package:in_stealth/Presentation/screens/CheckOut.dart';
import 'package:in_stealth/Presentation/screens/Home.dart';
import 'package:in_stealth/Presentation/screens/OrderSummary.dart';
import 'package:in_stealth/Presentation/screens/ShoppingCart.dart';
import 'package:in_stealth/Presentation/screens/Vegetables.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        'Vegetables': (context) => Vegetables(),
        'ShoppingCart': (context) => ShoppingCart(),
        'CheckOut': (context) => CheckOut(),
        'OrderSummary': (context) => OrderSummary(),
      },
    );
  }
}
