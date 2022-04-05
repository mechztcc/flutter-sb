import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/category/category_module.dart';
import 'package:flutter_sb/app/modules/dashboard/dashboard_module.dart';
import 'package:flutter_sb/app/modules/foodstore/foodstore_module.dart';
import 'package:flutter_sb/app/modules/product/product_module.dart';
import 'package:flutter_sb/app/modules/user/user_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<Module> get imports => [
    FoodstoreModule(),
    DashboardModule(),
    CategoryModule(),
    ProductModule()
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: UserModule()),
    ModuleRoute('/dashboard', module: DashboardModule()),
    ModuleRoute('/foodstore', module: FoodstoreModule()),
  ];
}
