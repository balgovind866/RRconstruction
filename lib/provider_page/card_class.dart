

import 'package:flutter/cupertino.dart';

class Product{
  String? name;
  double? price;
  int? qty=1;
  int? qntty;
  List? imgagesUrl;
  String documentID;
  String suppId;
  Product({
    required this.name,
    required this.price,
    required this.qty,
    required this.qntty,
    required this.imgagesUrl,
    required this.documentID,
    required this.suppId,
});
}
class Cart extends ChangeNotifier {
  final List<Product> _list = [];

  List<Product> get getItems {
    return _list;
  }

  int? get count {
    _list.length;
  }

  void addItem(String? name,
      double? price,
      int? qty,
      int? qntty,
      List? imgagesUrl,
      String documentID,
      String suppId,) {
    final product = Product(
        name: name,
        price: price,
        qty: qty,
        qntty: qntty,
        imgagesUrl: imgagesUrl,
        documentID: documentID,
        suppId: suppId
    );
    _list.add(product);
    notifyListeners();
  }
}
