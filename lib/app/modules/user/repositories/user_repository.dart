import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333/users/create';

  UserRepository(this.dio);

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await dio.post(
        url,
        data: {'name': name, 'email': email, 'password': password},
      );
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
