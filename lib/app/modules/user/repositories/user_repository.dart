import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sb/app/modules/user/models/user_model.dart';

class UserRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333';

  UserRepository(this.dio);

  Future<void> createAccount(String name, String email, String password) async {
    try {
      await dio.post(
        '$url/users/create',
        data: {'name': name, 'email': email, 'password': password},
      );
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var response = await dio.post(
        '$url/auth',
        data: { 'email': email, 'password': password },
      );
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
