
import 'package:store_app_2/helper/api_helper.dart';
import 'package:store_app_2/model/prodect_model.dart';

class UpdataAllProdect {
  Future<ProdectModel> upDataAllProdect({
    required dynamic id,
    required String title,
    required dynamic price,
    required String description,
    required String image,
    required var category,
  }) async {
    print('id:$id');
    Map<String, dynamic> data =
        await Api().put(url: 'https://fakestoreapi.com/products/$id', body: {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': category,
    });
    return ProdectModel.fromJson(data);
  }
}
