import 'package:dio/dio.dart';

class UserRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333';

  UserRepository(this.dio);

  Future<void> createAccount(String name, String phone, String password) async {
    try {
      await dio.post(
        '$url/customers/create',
        data: {'name': name, 'phone': phone, 'password': password},
      );
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }

  Future<Map<String, dynamic>> login(String phone, String password) async {
    try {
      var response = await dio.post(
        '$url/auth',
        data: { 'phone': phone, 'password': password },
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
