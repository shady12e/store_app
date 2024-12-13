import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_app_2/model/prodect_model.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<ProdectModel> favorites = [];
  List<ProdectModel> get favorit => favorites;
  void toggleFavorite(ProdectModel prodectModel) {
    if (favorites.contains(prodectModel)) {
      favorites.remove(prodectModel);
      
    } else {
      favorites.add(prodectModel);
    }
    notifyListeners();
  }

  bool isExsit(ProdectModel prodectModel) {
    final isExsit = favorites.contains(prodectModel);
    return isExsit;
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(context, listen: listen);
  }
}
