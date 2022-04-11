import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/user/models/user_model.dart';

class UserRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333';

  UserRepository(this.dio);

  Future<void> createAccount(UserModel user) async {
    try {
      await dio.post(
        '$url/customers/create',
        data: {
          'name': user.name,
          'phone': user.phone,
          'password': user.password,
          'address': user.address
        },
      );
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }

  Future<Map<String, dynamic>> login(String phone, String password) async {
    try {
      var response = await dio.post(
        '$url/customers/auth',
        data: {'phone': phone, 'password': password},
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
