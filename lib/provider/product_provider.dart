import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [];
  bool isLoading = true;
  int? index;

  Future<void> getProduct() async {
    try {
      await FirebaseFirestore.instance
          .collection('product')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          products.add(ProductModel(
            element.id,
            element.data()['productName'],
            element.data()['description'],
            element.data()['price'],
            element.data()['series'],
          ));
        });
      });

      isLoading = false;
      notifyListeners();
      print('data is ${products[1].description}');
    } catch (e) {
      print('error found in product provider $e');
    }
    notifyListeners();
  }
}
