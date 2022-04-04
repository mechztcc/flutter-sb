

import 'package:flutter_sb/app/modules/category/models/category_model.dart';
import 'package:flutter_sb/app/modules/category/repositories/category_repositories.dart';

class CategoryService { 
  final CategoryRepository categoryRepository;

  CategoryService({required this.categoryRepository});

  Future<List<CategoryModel>> listAll(int id) async {
    try {
      var categories = await categoryRepository.listAll(id);
      return categories;
    } catch (e) {
       throw Exception(e);
    }
  }
}