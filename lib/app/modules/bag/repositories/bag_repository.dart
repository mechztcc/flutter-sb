import 'package:dio/dio.dart';

class BagRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333/bag';

  BagRepository({required this.dio});

  Future<void> create(int customer_id) async {
    try {
      var response = await  dio.post('$url/create');

    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
