import 'package:flutter_sb/app/modules/category/category_Page.dart';
import 'package:flutter_sb/app/modules/category/controllers/category_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/repositories/category_repositories.dart';
import 'package:flutter_sb/app/modules/category/services/category_service.dart';

class CategoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CategoryStore(categoryService: i()), export: true),
    Bind.lazySingleton((i) => CategoryService(categoryRepository: i()), export: true),
    Bind.lazySingleton((i) => CategoryRepository(dio: i()), export: true)
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const CategoryPage()),
  ];
}
