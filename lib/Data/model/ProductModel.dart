class ProductModel {
  int productID;
  String productName;
  String productBrand;
  String productSKU;
  double productPrice;
  double productStrikePrice;
  String productImageURL;
  int productQuantity;
  bool productInStock;

  ProductModel(
      {required this.productID,
      required this.productName,
      required this.productBrand,
      required this.productSKU,
      required this.productPrice,
      required this.productStrikePrice,
      required this.productImageURL,
      required this.productQuantity,
      required this.productInStock});
}
