import 'package:flutter_sb/app/modules/bag/bag_Page.dart';
import 'package:flutter_sb/app/modules/bag/bag_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BagModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => BagStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => BagPage()),
  ];
}
