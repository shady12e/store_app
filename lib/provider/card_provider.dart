import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_2/model/prodect_model.dart';

class CardProvider extends ChangeNotifier {
  final List<ProdectModel> cardprodect = [];
  List<ProdectModel> get card => cardprodect;
  void toggleCard(ProdectModel prodectModel) {
    if (cardprodect.contains(prodectModel)) {
      cardprodect.remove(prodectModel);
    } else {
      cardprodect.add(prodectModel);
    }
    notifyListeners();
  }

  bool isExsit(ProdectModel prodectModel) {
    final isExsit = cardprodect.contains(prodectModel);
    return isExsit;
  }

  // Assuming you have a list of products
  List<ProdectModel> countProdect = [];

  // A map to hold counts for each product, initialized to 0
  Map<dynamic, int> _productCounts = {};

  // Method to get count for a specific item by its id
  int getCount(dynamic id) {
    return _productCounts[id] ?? 0; // If no count, return 0
  }

  // Method to increase count for a specific item
  void incrementCount(dynamic id) {
    _productCounts[id] = (_productCounts[id] ?? 0) + 1;
    notifyListeners(); // Notify listeners to rebuild
  }

  // Method to decrease count for a specific item
  void decrementCount(dynamic id) {
    if (_productCounts[id] != null && _productCounts[id]! > 0) {
      _productCounts[id] = _productCounts[id]! - 1;
      if (_productCounts[id]! <= 0) {
        _productCounts.remove(id); // Remove from count map
        cardprodect.removeWhere(
            (product) => product.id == id); // Remove from the product list
      }
      notifyListeners(); // Notify listeners to rebuild
    }
  }

  static CardProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<CardProvider>(context, listen: listen);
  }
}
