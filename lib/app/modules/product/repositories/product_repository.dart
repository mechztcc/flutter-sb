

import 'package:dio/dio.dart';

class ProductRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333';

  ProductRepository({required this.dio});
}