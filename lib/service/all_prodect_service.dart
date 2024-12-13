import 'package:store_app_2/helper/api_helper.dart';
import 'package:store_app_2/model/prodect_model.dart';

class AllProdectService {
   
  Future<List<ProdectModel>> getAllProdect() async {
    List<dynamic> data =
        await Api().getAllProdect(url: 'https://fakestoreapi.com/products');

    List<ProdectModel> getProdectdataList = [];
    for (int i = 0; i < data.length; i++) {
      getProdectdataList.add(ProdectModel.fromJson(data[i]));
    }
    return getProdectdataList;
  }
}
