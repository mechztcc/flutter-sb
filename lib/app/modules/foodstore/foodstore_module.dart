import 'package:flutter_sb/app/modules/foodstore/services/foodstore_service.dart';
import 'package:flutter_sb/app/modules/foodstore/repositories/foodstore_repository.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/foodstore/controllers/foodstore_store.dart';

class FoodstoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FoodstoreService(foodstoreRepository: i()), export: true),
    Bind.lazySingleton((i) => FoodstoreRepository(dio: i()), export: true),
    Bind.lazySingleton((i) => FoodstoreStore(foodstoreService: i()), export: true),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/', child: (_, args) => FoodstorePage()),
  ];
}
