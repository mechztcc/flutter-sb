import 'package:flutter_sb/app/modules/product/product_Page.dart';
import 'package:flutter_sb/app/modules/product/product_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProductPage()),
  ];
}
