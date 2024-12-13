import 'package:store_app_2/helper/api_helper.dart';

class AllCategoryService {
  Future<List<String>> getAllCategory() async {
    List<dynamic> data = await Api()
        .getAllProdect(url: 'https://fakestoreapi.com/products/categories');
           print('API Response: $data');

      List<String> categories = List<String>.from(data);

    return categories;
  }
}
