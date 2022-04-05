import 'package:flutter_sb/app/modules/dashboard/controllers/dashboard_store.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sb/app/modules/dashboard/pages/bag_page.dart';
import 'package:flutter_sb/app/modules/dashboard/pages/dashboard_page.dart';

class DashboardModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => DashboardPage()),
    ChildRoute('/bag', child: (_, args) => const BagPage()),
  ];
}
