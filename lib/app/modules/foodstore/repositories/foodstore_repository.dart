import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/foodstore/models/foodstore_model.dart';

class FoodstoreRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333';

  FoodstoreRepository({required this.dio});


  Future<List<FoodstoreModel>> listAll() async {
    try {
      var response = await dio.get('$url/foodstores/list-all');

      List<FoodstoreModel> foodstores = [];

      for (var item in response.data) {
      FoodstoreModel foodstore = FoodstoreModel.fromJson(item);
      foodstores.add(foodstore);
      }
      return foodstores;
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
