import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/bag/model/bag_model.dart';

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
}