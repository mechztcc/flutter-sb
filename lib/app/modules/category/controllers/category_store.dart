import 'package:flutter_sb/app/modules/category/models/category_model.dart';
import 'package:flutter_sb/app/modules/category/services/category_service.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;
abstract class _CategoryStoreBase with Store {

  final CategoryService categoryService;

  _CategoryStoreBase({required this.categoryService});

  Future<List<CategoryModel>> listAll(int id) async {
    try {
      List<CategoryModel> response = await categoryService.listAll(id);
      return response;
    } catch (e) {
      print(e);
      return [];
    }
  }

}