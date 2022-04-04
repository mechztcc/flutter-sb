import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/category/models/category_model.dart';

class CategoryRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333/categories';

  CategoryRepository({required this.dio});

  Future<List<CategoryModel>> listAll(int id) async {
    try {
      var response = await dio.get('${url}/findByFoodstore/${id}');

      List<CategoryModel> categories = [];

      for (var item in response.data) {
        CategoryModel category = CategoryModel.fromJson(item);
        categories.add(category);
      }

      return categories;
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
