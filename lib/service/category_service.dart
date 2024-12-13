import 'package:store_app_2/helper/api_helper.dart';
import 'package:store_app_2/model/prodect_model.dart';

class CategoryService {
  

  Future<List<ProdectModel>> GetCategory({required String CategoryName}) async {
    List<dynamic> data = await Api().getAllProdect(
        url: 'https://fakestoreapi.com/products/category/$CategoryName');
    List<ProdectModel> getCategoryDataList = [];
    for (int i = 0; i < data.length; i++) {
      getCategoryDataList.add(ProdectModel.fromJson(data[i]));
    }
    return getCategoryDataList;
  }
}
