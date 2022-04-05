import 'package:dio/dio.dart';
import 'package:flutter_sb/app/modules/category/models/category_model.dart';
import 'package:flutter_sb/app/modules/category/models/category_products_model.dart';

class CategoryRepository {
  final Dio dio;
  final String url = 'http://192.168.1.5:3333/categories';

  CategoryRepository({required this.dio});

  Future<List<CategoryModel>> listAll(int id) async {
    try {
      var response = await dio.get('${url}/find-products/foodstore/${id}');

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

  Future<List<CategoryProductsModel>> listAllCategoriesWithProds(int id) async {
    try {
      Response response = await dio.get('$url/list/foodstore/$id');

      List<CategoryProductsModel> categories = [];
      for (var item in response.data) {
        CategoryProductsModel categoryProd = CategoryProductsModel.fromJson(item);
        categories.add(categoryProd);
      }

      print(categories);
      return categories;
    } on DioError catch (e) {
      throw Exception(e.response);
    }
  }
}
