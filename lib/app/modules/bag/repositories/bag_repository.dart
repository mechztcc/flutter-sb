import 'package:asuka/asuka.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';
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
}
