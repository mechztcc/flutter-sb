import 'package:flutter_sb/app/modules/product/controller/bag_store.dart';
import 'package:flutter_sb/app/modules/product/controller/product_store.dart';
import 'package:flutter_sb/app/modules/product/pages/product_details_page.dart';
import 'package:flutter_sb/app/modules/product/product_Page.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BagStore(), export: true),
    Bind.lazySingleton((i) => ProductStore(), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProductPage()),
    ChildRoute('/details/:id', child: (_, args) => ProductDetailsPage(id: args.params['id'],)),
  ];
}
