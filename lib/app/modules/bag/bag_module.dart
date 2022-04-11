import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/bag/bag_Page.dart';
import 'package:flutter_sb/app/modules/bag/controllers/bag_store.dart';
import 'package:flutter_sb/app/modules/bag/repositories/bag_repository.dart';
import 'package:flutter_sb/app/modules/bag/services/bag_service.dart';

class BagModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BagStore(bagService: i()), export: true),
    Bind.lazySingleton((i) => BagRepository(dio: i()), export: true),
    Bind.lazySingleton((i) => BagService(bagRepository: i()), export: true)
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BagPage()),
  ];
}
