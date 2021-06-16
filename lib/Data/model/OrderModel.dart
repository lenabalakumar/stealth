import 'package:in_stealth/Data/model/CartModel.dart';

class OrderModel {
  String orderId;
  double grandTotal;
  List<CartModel> cartProducts;
  DateTime dateTime;

  OrderModel(
      {required this.orderId,
      required this.grandTotal,
      required this.cartProducts,
      required this.dateTime});
}

