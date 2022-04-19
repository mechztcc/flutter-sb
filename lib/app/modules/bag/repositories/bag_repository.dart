import 'package:asuka/asuka.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';
import 'package:flutter_sb/app/modules/product/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BagRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333/bag';

  BagRepository({required this.dio});

  Future<BagModel> create() async {
    try {
      var response = await dio.post('$url/create');

      BagModel bag = BagModel.fromJson(response.data);

      return bag;
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }

  Future<BagModel> find() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      dio.options.headers['authorization'] = 'Bearer $token';

      var response = await dio.get('$url/find-bag');

      BagModel bag = BagModel.fromJson(response.data);
      return bag;
    } on DioError catch (e) {
      AsukaSnackbar.alert('Falha ao conectar com servidor').show();
      print(e);
      throw Exception(e.response);
    }
  }

  Future<void> clearBag() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      dio.options.headers['authorization'] = 'Bearer $token';

      var response = await dio.delete('$url/clear');
    } on DioError catch (e) {
      AsukaSnackbar.alert('Falha ao conectar com servidor').show();
      print(e);
      throw Exception(e.response);
    }
  }

  Future<void> addItem(ProductModel prod) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      dio.options.headers['authorization'] = 'Bearer $token';

      var response = await dio.post('$url/add-item', data: {
        "id": prod.id,
        "name": prod.name,
        "price": prod.price,
        "size": prod.size
      });
    } on DioError catch (e) {
      AsukaSnackbar.alert('Falha ao conectar com servidor').show();
      print(e);
      throw Exception(e.response);
    }
  }

  Future<void> removeItem(int itemId) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      dio.options.headers['authorization'] = 'Bearer $token';

      await dio.delete('$url/remove-item', data: {"item_id": itemId});
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }

  Future<Map<String, dynamic>> total() async {
    try {
      
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      dio.options.headers['authorization'] = 'Bearer $token';

      var response = await dio.get('$url/total');

      return response.data;

    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
