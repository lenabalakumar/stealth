class CartModel {
  int productID;
  String productName;
  String productSKU;
  double productPrice;
  String productImageURL;
  int productQuantity;

  CartModel({
    required this.productID,
    required this.productName,
    required this.productSKU,
    required this.productPrice,
    required this.productImageURL,
    required this.productQuantity,
  });
}
