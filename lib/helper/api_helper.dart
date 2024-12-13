import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio = Dio();

  Future<dynamic> getAllProdect({required String url}) async {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('theres was an error in getting data${response.data}');
    }
  }

  Future<dynamic> post({required String url, @required dynamic body}) async {
    Response response = await dio.post(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception(
          'there was an error in posting data${response.statusCode}');
    }
  }

  Future<dynamic> put({required String url, @required dynamic body}) async {
    try {
      print('url = $url , body =$body');
      Response response = await dio.put(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        print(data);
        return data;
      } else {
        throw Exception(
            'there was an error in putting data${response.statusCode}');
      }
    } on DioException catch (e) {
      print('theres was an erorr in putting dataaa${e.response?.data}');
    }
  }
}
