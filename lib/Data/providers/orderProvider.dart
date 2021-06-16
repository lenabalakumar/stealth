import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:in_stealth/Data/model/CartModel.dart';
import 'package:in_stealth/Data/model/OrderModel.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> _orders = [];

  List<OrderModel> get orders => _orders;

  Future<void> addOrder(List<CartModel> cartProducts, double total) async {
    final url = Uri.parse(
        'https://stealth-87e3d-default-rtdb.firebaseio.com/orders.json');

    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'id': DateTime.now().toString(),
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      'id': cp.productID,
                      'title': cp.productName,
                      'quantity': cp.productQuantity,
                      'price': cp.productPrice
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          OrderModel(
              orderId: json.decode(response.body)['name'],
              grandTotal: total,
              dateTime: timeStamp,
              cartProducts: cartProducts));
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
