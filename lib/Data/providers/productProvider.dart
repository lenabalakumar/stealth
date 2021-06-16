import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:in_stealth/Data/model/ProductModel.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> topProductsData = [];

  ProductModel product = ProductModel(
      productID: 0,
      productName: '',
      productBrand: '',
      productSKU: '',
      productPrice: 0.0,
      productStrikePrice: 0.0,
      productImageURL: '',
      productQuantity: 0,
      productInStock: false);

  fetchTopProductsData() async {
    List<ProductModel> tempTopProductsData = [];
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("TopProducts").get();

    snapshot.docs.forEach((element) {
      product = ProductModel(
          productID: element.get("productID"),
          productName: element.get("productName"),
          productBrand: element.get("productBrand"),
          productSKU: element.get("productSKU"),
          productPrice: element.get("productPrice"),
          productStrikePrice: element.get("productStrikePrice"),
          productImageURL: element.get("productImageURL"),
          productQuantity: element.get("productQuantity"),
          productInStock: element.get("productInStock"),);
      tempTopProductsData.add(product);
    },);
    topProductsData = tempTopProductsData;
    notifyListeners();
  }

  List<ProductModel> get getTopProductsList => topProductsData;

  ProductModel findById(int iD){
    return topProductsData.firstWhere((element) => element.productID == iD);
  }
}
