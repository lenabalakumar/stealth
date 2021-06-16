import 'package:flutter/cupertino.dart';
import 'package:in_stealth/Data/model/CartModel.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get cartItems => _cartItems;

  int get cartItemCount => _cartItems.length;

  void addItemToCart(int iD, String pName, double pPrice, String imageURL,
      String pSKU, int pQuantity) {
    if (_cartItems.containsKey(iD.toString())) {
      _cartItems.update(
        iD.toString(),
        (existingCartItem) => CartModel(
            productID: existingCartItem.productID,
            productName: existingCartItem.productName,
            productSKU: existingCartItem.productSKU,
            productPrice: existingCartItem.productPrice,
            productImageURL: existingCartItem.productImageURL,
            productQuantity: existingCartItem.productQuantity + 1),
      );
    } else {
      _cartItems.putIfAbsent(
          iD.toString(),
          () => CartModel(
              productID: iD,
              productName: pName,
              productSKU: pSKU,
              productPrice: pPrice,
              productImageURL: imageURL,
              productQuantity: 1));
    }
    notifyListeners();
  }

  void removeSingleItem(int iD) {
    if (cartItems.containsKey(iD.toString())) {
      _cartItems.update(
          iD.toString(),
          (existingCartItem) => CartModel(
              productID: existingCartItem.productID,
              productName: existingCartItem.productName,
              productSKU: existingCartItem.productSKU,
              productPrice: existingCartItem.productPrice,
              productImageURL: existingCartItem.productImageURL,
              productQuantity: existingCartItem.productQuantity == 0
                  ? 0
                  : existingCartItem.productQuantity - 1));
    }
    notifyListeners();
  }

  void removeItem(int iD) {
    _cartItems.remove(iD.toString());
    notifyListeners();
  }


  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.productPrice * cartItem.productQuantity;
    });
    return total;
  }
}
